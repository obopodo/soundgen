import io
from pathlib import Path
from typing import Literal

import numpy as np
import pandas as pd
import torch
from scipy.io import wavfile
from torch.utils.data import DataLoader, Dataset

FSDD_FOLDER = Path(__file__).parent.parent.parent / "data" / "FSDD_parquet"


class FSDDRawDataset(Dataset):
    def __init__(self, data_folder: str | Path = FSDD_FOLDER, split: str = "train"):
        data_folder = Path(data_folder)
        self.df = pd.read_parquet(data_folder / f"{split}-00000-of-00001.parquet")

    def __len__(self) -> int:
        return len(self.df)

    def __getitem__(self, idx: int) -> tuple[int, np.ndarray, int]:
        row = self.df.iloc[idx]
        audio_bytes = row["audio"]["bytes"]
        label = row["label"]
        sample_rate, waveform = wavfile.read(io.BytesIO(audio_bytes))
        return sample_rate, waveform, label


class FSDDSpetrogramDataset(Dataset):
    def __init__(self, data_folder: str | Path = FSDD_FOLDER / "processed_mel_spectrograms", split: str = "train"):
        data_folder = Path(data_folder) / split
        self.file_paths = list(data_folder.glob("*.pt"))

    def __len__(self) -> int:
        return len(self.file_paths)

    def __getitem__(self, idx: int) -> dict:
        file_path = self.file_paths[idx]
        data = torch.load(file_path)
        return data["spectrogram"], data["label"]


def get_fsdd_preprocessed_loaders(batch_size: int = 32) -> tuple[DataLoader, DataLoader]:
    """Get DataLoaders for FSDD preprocessed spectrogram dataset.

    Returns:
        tuple[DataLoader, DataLoader]: train and test DataLoaders
    """
    train_dataset = FSDDSpetrogramDataset(split="train")
    test_dataset = FSDDSpetrogramDataset(split="test")

    train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
    test_loader = DataLoader(test_dataset, batch_size=batch_size, shuffle=False)

    return train_loader, test_loader


if __name__ == "__main__":
    dataset = FSDDSpetrogramDataset(split="test")
    print(f"Dataset size: {len(dataset)}")
    print(f"Data sample types:")
    for key, value in dataset[0].items():
        print(f"  {key}: {type(value)}")
        if key == "spectrogram":
            print(f"    shape: {value.shape}")
