from pathlib import Path
from typing import Callable

import librosa
from torch import Tensor
from torch.utils.data import Dataset


class TinyPianoDataset(Dataset):

    def __init__(self, data_folder: str, transform: Callable | None = None, target_sr: int | None = 22050):
        self.data_folder = self._check_folder(data_folder)
        self.files = self._get_files(self.data_folder)
        self.transform = transform
        self.target_sr = target_sr  # if None, use original sample rate else resample

    def _check_folder(self, folder: str) -> Path:
        folder: Path = Path(folder)
        if not folder.exists():
            raise FileNotFoundError(f"Folder {folder} does not exist.")
        return folder

    def _get_files(self, folder: Path) -> list[Path]:
        files = sorted(folder.glob("*.wav"))
        if len(files) == 0:
            raise FileNotFoundError(f"No .wav files found in folder {folder}.")
        return files

    def _load_audio(self, file_path: Path) -> tuple[Tensor, int]:
        waveform, sample_rate = librosa.load(file_path, mono=True, sr=self.target_sr)
        return waveform, sample_rate

    def get_audio(self, idx: int) -> Tensor:
        file = self.files[idx]
        waveform, sample_rate = self._load_audio(file)
        waveform = Tensor(waveform)
        return waveform

    def _parse_label(self, file_path: Path) -> int:
        # Assuming the label is encoded in the filename as 'piano_<label>.wav'
        filename = file_path.stem
        label_str = filename.split("_")[-1]
        return int(label_str)

    def __getitem__(self, idx: int) -> tuple[Tensor, int, int]:
        file = self.files[idx]
        waveform, sample_rate = self._load_audio(file)
        waveform = Tensor(waveform)
        label = self._parse_label(file)
        if self.transform:
            waveform = self.transform(waveform)
        return waveform, sample_rate, label

    def __len__(self) -> int:
        return len(self.files)
