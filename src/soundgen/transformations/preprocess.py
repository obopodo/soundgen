import io
from typing import Literal

import numpy as np
import pandas as pd
import torch
from IPython.display import Audio, display
from scipy.io import wavfile
from torch import nn
from torchaudio.transforms import MelSpectrogram, Spectrogram
from tqdm import tqdm


class PreprocessingModule(nn.Module):

    def __init__(
        self,
        sample_rate: int,
        num_samples: int = 32700,  # to get 64x64 spectrograms
        n_fft: int = 1024,
        n_mels: int = 64,
        power: float = 1.0,
        *,
        representation: Literal["mel", "stft"] = "mel",
        hop_length: int | None = None,
        win_length: int | None = None,
        target_shape: tuple[int, int] | None = None,
    ):
        """Pipeline for audio to spectrogram transformation.

        Parameters
        ----------
        sample_rate : int
            Sample rate of the input audio. Must be the same for all audios.
            In this package it's ensured by the dataset class.
        num_samples : int, optional
            The target number of samples for the audio, by default 22050.
            If the audio is shorter, it will be padded, if longer, it will be cropped.
        n_fft : int, optional
            The number of FFT components, by default 1024
        n_mels : int, optional
            The number of Mel bands, by default 64
        power : float, optional
            Exponent for the magnitude spectrogram, by default 1.0
        representation : Literal["mel", "stft"], optional
            Type of spectrogram to compute, by default "mel".
        hop_length : int | None, optional
            Number of audio samples between adjacent STFT columns, by default None. If None, defaults to n_fft // 2.
        win_length : int | None, optional
            Window size for STFT, by default None. If None, defaults to n_fft.
        target_shape : tuple[int, int] | None, optional
            If provided, resize spectrograms to this (freq, time) shape, by default None.
            Uses bilinear interpolation. Needed to have a fixed-size input for VAE.
        """
        super().__init__()

        self.sample_rate = sample_rate
        self.num_samples = num_samples
        self.n_fft = n_fft
        self.n_mels = n_mels
        self.power = power
        self.representation = representation
        self.hop_length = hop_length if hop_length is not None else n_fft // 2
        self.win_length = win_length if win_length is not None else n_fft
        self.target_shape = target_shape

        if representation == "mel":
            self.spectrogram = MelSpectrogram(
                sample_rate=sample_rate,
                n_fft=n_fft,
                hop_length=self.hop_length,
                win_length=self.win_length,
                n_mels=n_mels,
                power=power,
                mel_scale="htk",
            )
        elif representation == "stft":
            self.spectrogram = Spectrogram(
                n_fft=n_fft,
                hop_length=self.hop_length,
                win_length=self.win_length,
                power=power,
            )
        else:
            raise ValueError(f"Unknown representation: {representation}")

    def forward(self, waveform: torch.Tensor) -> torch.Tensor:
        """Apply resampling (if needed), mixdown, length fix, and mel spectrogram.

        Parameters
        ----------
        waveform: Tensor[C, T]
            Audio waveform.
        sample_rate: int
            The actual sample rate of this waveform.
        """
        waveform = self._to_mono(waveform)
        waveform = self._normalize_audio(waveform)
        waveform = self._crop_or_pad(waveform)
        spectrogram = self.spectrogram(waveform)
        spectrogram = self._resize_spectrogram(spectrogram)
        spectrogram = self._normalize_spectrogram(spectrogram)
        spectrogram = spectrogram.unsqueeze(0)  # Add channel dimension
        # spectrogram = waveform
        return spectrogram

    def _to_mono(self, waveform: torch.Tensor) -> torch.Tensor:
        """Ensure waveform is a 1D mono tensor.

        At the moment it's not very necessary since the TinyPianoDataset already loads audio as mono.
        """
        if waveform.ndim == 1:
            return waveform
        if waveform.ndim == 2:
            # assume [C, T]
            return waveform.mean(dim=0)
        raise ValueError(f"Unexpected waveform shape: {tuple(waveform.shape)}")

    def _crop_or_pad(self, waveform: torch.Tensor) -> torch.Tensor:
        """Crop or pad the waveform to the target number of samples.

        Right side padding will be applied if the waveform is shorter than the target length.
        """
        if waveform.ndim != 1:
            raise ValueError(f"Expected mono waveform [T], got shape {tuple(waveform.shape)}")

        if waveform.shape[0] > self.num_samples:
            waveform = waveform[: self.num_samples]
        elif waveform.shape[0] < self.num_samples:
            padding_size = self.num_samples - waveform.shape[0]
            # The padding size by which to pad some dimensions of input are
            # described starting from the last dimension and moving forward.
            # For each dim we pass 2 numbers: left_pad and right_pad, so len(pad)/2 dimensions of the input will be padded.
            # In the case [channels, samples] we need to pad only the last dim, so the pad argument could look just like (left_pad, right_pad)
            # which is equal to (left_pad, right_pad, 0, 0)
            waveform = nn.functional.pad(waveform, (0, padding_size))
        return waveform

    def _normalize_audio(self, waveform: torch.Tensor) -> torch.Tensor:
        """Convert integer PCM to float32 in [-1, 1]."""
        max_amplitude = waveform.abs().max()
        if max_amplitude > 0:
            waveform = waveform.float() / float(max_amplitude)
        else:
            waveform = waveform.float()
        return waveform

    def _resize_spectrogram(self, spectrogram: torch.Tensor) -> torch.Tensor:
        """Optionally resize spectrogram to a fixed (freq, time) shape.

        This keeps the representation linear (no mel), but helps match a fixed VAE input size.
        """
        if self.target_shape is None:
            return spectrogram

        if spectrogram.ndim != 2:
            raise ValueError(f"Expected spectrogram [F, T], got shape {tuple(spectrogram.shape)}")

        target_freq, target_time = self.target_shape
        spec_4d = spectrogram.unsqueeze(0).unsqueeze(0)
        spec_4d = nn.functional.interpolate(
            spec_4d,
            size=(target_freq, target_time),
            mode="bilinear",
            align_corners=False,
        )
        return spec_4d.squeeze(0).squeeze(0)

    def _normalize_spectrogram(self, spectrogram: torch.Tensor) -> torch.Tensor:
        """Normalize spectrogram to [0, 1] range."""

        s_min = spectrogram.min().item()
        s_max = spectrogram.max().item()
        spectrogram_norm = (spectrogram - s_min) / (s_max - s_min + 1e-9)
        return spectrogram_norm

    def _augment(self, waveform: torch.Tensor):
        return waveform  # Placeholder for future augmentations


class PreprocessingPipeline:
    """Pipeline to prepare dataset as mel spectrograms and save to disk."""

    def __init__(self, dataset_path: str):
        self.module = PreprocessingModule()
        self.dataset_path = dataset_path
        self.df = pd.read_parquet(dataset_path)

    def save_spectrogram(self, path: str) -> None:
        raise NotImplementedError("This is a placeholder for a preprocessing pipeline.")

    def audio_from_table(self, idx: int) -> tuple[int, np.ndarray]:
        audio_bytes = self.df.loc[idx, "audio"]["bytes"]
        sample_rate, audio_data = wavfile.read(io.BytesIO(audio_bytes))
        return sample_rate, audio_data

    def play_sample(self, idx: int) -> None:
        sample_rate, audio_data = self.audio_from_table(idx)
        display(Audio(data=audio_data, rate=sample_rate))

    def run(self, save_folder: str) -> None:
        for idx, row in tqdm(self.df.iterrows(), total=len(self.df)):
            label = row["label"]
            sample_rate, audio_data = self.audio_from_table(idx)
            audio_data = np.asarray(audio_data).copy()  # Ensure torch gets a writable ndarray
            waveform = torch.from_numpy(audio_data).unsqueeze(0)  # Add batch dimension
            spectrogram = self.module(waveform, sample_rate, save_path=save_folder)
            torch.save(
                {
                    "spectrogram": spectrogram,
                    "label": label,
                },
                f"{save_folder}/id{idx}_label{label}.pt",
            )

    def __len__(self) -> int:
        return len(self.df)

    @property
    def size(self) -> int:
        return len(self.df)


if __name__ == "__main__":
    from pathlib import Path

    dataset_folder = Path(__file__).parent.parent.parent / "data" / "FSDD_parquet"
    train_dataset_path = dataset_folder / "train-00000-of-00001.parquet"
    test_dataset_path = dataset_folder / "test-00000-of-00001.parquet"

    save_folder = dataset_folder / "processed_mel_spectrograms"
    save_folder_train = save_folder / "train"
    save_folder_test = save_folder / "test"
    save_folder_train.mkdir(parents=True, exist_ok=True)
    save_folder_test.mkdir(parents=True, exist_ok=True)

    print("Processing train dataset...")
    pipeline = PreprocessingPipeline(str(train_dataset_path))
    pipeline.run(save_folder=save_folder_train)

    print("Processing test dataset...")
    pipeline = PreprocessingPipeline(str(test_dataset_path))
    pipeline.run(save_folder=save_folder_test)
