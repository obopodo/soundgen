import io

import numpy as np
import pandas as pd
import torch
from IPython.display import Audio, display
from scipy.io import wavfile
from torch import nn
from torchaudio import functional as AF
from torchaudio.transforms import Fade, MelSpectrogram, TimeMasking, TimeStretch
from tqdm import tqdm


class PreprocessingModule(nn.Module):

    def __init__(
        self,
        sample_rate: int,
        num_samples: int = 32700,  # to get 64x64 spectrograms
        n_fft: int = 1024,
        n_mels: int = 64,
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
        """
        super().__init__()
        self.spectrogram = MelSpectrogram(
            sample_rate=sample_rate,
            n_fft=n_fft,
            hop_length=n_fft // 2,
            n_mels=n_mels,
        )
        self.num_samples = num_samples

    def forward(self, waveform: torch.Tensor) -> torch.Tensor:
        """Apply resampling (if needed), mixdown, length fix, and mel spectrogram.

        Parameters
        ----------
        waveform: Tensor[C, T]
            Audio waveform.
        sample_rate: int
            The actual sample rate of this waveform.
        """
        waveform = self._normalize_audio(waveform)
        waveform = self._crop_or_pad(waveform)
        spectrogram = self.spectrogram(waveform)
        spectrogram, s_min, s_max = self._normalize_spectrogram(spectrogram)
        spectrogram = spectrogram.unsqueeze(0)  # Add channel dimension
        # spectrogram = waveform
        return spectrogram

    def _crop_or_pad(self, waveform: torch.Tensor) -> torch.Tensor:
        """Crop or pad the waveform to the target number of samples.

        Right side padding will be applied if the waveform is shorter than the target length.
        """
        if waveform.shape[0] > self.num_samples:
            waveform = waveform[:, : self.num_samples]
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
        waveform = waveform.float() / float(max_amplitude)
        return waveform

    def _normalize_spectrogram(self, spectrogram: torch.Tensor) -> tuple[torch.Tensor, float, float]:
        """Normalize spectrogram to [0, 1] range.

        Returns
        -------
        spectrogram_norm : torch.Tensor
            Normalized spectrogram.
        s_min : float
            Minimum value of the original spectrogram.
        s_max : float
            Maximum value of the original spectrogram.
        """
        s_min = spectrogram.min().item()
        s_max = spectrogram.max().item()
        spectrogram_norm = (spectrogram - s_min) / (s_max - s_min + 1e-9)
        return spectrogram_norm, s_min, s_max

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
            spectrogram, s_min, s_max = self.module(waveform, sample_rate, save_path=save_folder)
            torch.save(
                {
                    "spectrogram": spectrogram,
                    "s_min": s_min,
                    "s_max": s_max,
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
