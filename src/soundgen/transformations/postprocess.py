import numpy as np
import soundfile as sf
from torch import Tensor
from torchaudio.transforms import GriffinLim, InverseMelScale


class MelToWaveformTransform:
    def __init__(self, sample_rate: int, n_fft: int, n_mels: int):
        self.invers_transform = InverseMelScale(
            sample_rate=sample_rate,
            n_stft=n_fft // 2 + 1,
            n_mels=n_mels,
        )
        self.grifflim_transform = GriffinLim(n_fft=n_fft)

    def save_audio(self, waveform: np.ndarray, filepath: str, target_sr: int) -> None:
        sf.write(filepath, waveform, target_sr)

    def __call__(self, mel_spectrogram: Tensor) -> np.ndarray:
        inverse_waveform = self.invers_transform(mel_spectrogram)
        pseudo_waveform: Tensor = self.grifflim_transform(inverse_waveform)
        pseudo_waveform = pseudo_waveform / pseudo_waveform.abs().max()
        return pseudo_waveform.squeeze().numpy()
