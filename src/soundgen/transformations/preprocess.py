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
        target_sample_rate: int = 22050,
        num_samples: int = 32700,  # to get 64x64 spectrograms
        n_fft: int = 1024,
        n_mels: int = 64,
    ):
        """Pipeline for audio to spectrogram transformation.

        Parameters
        ----------
        target_sample_rate : int, optional
            The target sample rate for the audio, by default 22050
        num_samples : int, optional
            The target number of samples for the audio, by default 22050.
            If the audio is shorter, it will be padded, if longer, it will be cropped.
        n_fft : int, optional
            The number of FFT components, by default 1024
        n_mels : int, optional
            The number of Mel bands, by default 64
        """
        super().__init__()
        self.mel_spectrogram = MelSpectrogram(
            sample_rate=target_sample_rate,
            n_fft=n_fft,
            hop_length=n_fft // 2,
            n_mels=n_mels,
        )
        self.num_samples = num_samples
        self.target_sample_rate = target_sample_rate

    def forward(self, waveform: torch.Tensor, sample_rate: int, save_path: str = "") -> torch.Tensor:
        """Apply resampling (if needed), mixdown, length fix, and mel spectrogram.

        Parameters
        ----------
        waveform: Tensor[C, T]
            Audio waveform.
        sample_rate: int
            The actual sample rate of this waveform.
        save_path: str, optional
            If provided, the processed spectrogram will be saved to this path, by default "".
        """
        waveform = self._normalize_audio(waveform)
        waveform = self._resample(waveform, sample_rate)
        waveform = self._mixdown(waveform)
        waveform = self._crop_or_pad(waveform)
        spectrogram = self.mel_spectrogram(waveform)
        spectrogram, s_min, s_max = self._normalize(spectrogram)
        spectrogram = spectrogram.unsqueeze(0)  # Add channel dimension
        return spectrogram, s_min, s_max

    def _resample(self, waveform: torch.Tensor, sample_rate: int) -> torch.Tensor:
        if sample_rate != self.target_sample_rate:
            # Use functional resample so we can handle varying input sample rates per item
            waveform = AF.resample(waveform, orig_freq=sample_rate, new_freq=self.target_sample_rate)
        return waveform

    def _mixdown(self, waveform: torch.Tensor) -> torch.Tensor:
        """Convert stereo to mono if necessary by averaging channels."""
        if waveform.shape[0] > 1:
            waveform = torch.mean(waveform, dim=0, keepdim=True)
        return waveform

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
        if not torch.is_floating_point(waveform):
            max_amplitude = waveform.abs().max()
            waveform = waveform.float() / float(max_amplitude)
        return waveform

    def _normalize(self, tensor: torch.Tensor) -> torch.Tensor:
        """Min-max normalization and saving."""
        tensor_min = tensor.min()
        tensor_max = tensor.max()
        tensor = (tensor - tensor_min) / (tensor_max - tensor_min)
        return tensor, tensor_min, tensor_max

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
