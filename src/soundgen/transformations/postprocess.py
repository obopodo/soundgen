import numpy as np
from torch import Tensor, nn
from torchaudio.transforms import GriffinLim, InverseMelScale


class MelToWaveformTransform(nn.Module):

    def __init__(
        self,
        sample_rate: int,
        n_fft: int,
        n_mels: int,
        s_min: float = 0.0,
        s_max: float = 5500.0,
        power: float = 1.0,
    ):
        super().__init__()
        self.invers_transform = InverseMelScale(
            sample_rate=sample_rate,
            n_stft=n_fft // 2 + 1,
            n_mels=n_mels,
        )
        self.grifflim_transform = GriffinLim(n_fft=n_fft, power=power)
        self.s_min = s_min
        self.s_max = s_max

    def forward(self, mel_spectrogram: Tensor) -> np.ndarray:
        mel_spectrogram = mel_spectrogram.clamp(min=0)
        mel_spectrogram = mel_spectrogram * (self.s_max - self.s_min) + self.s_min
        inverse_waveform = self.invers_transform(mel_spectrogram)
        pseudo_waveform: Tensor = self.grifflim_transform(inverse_waveform)
        pseudo_waveform = pseudo_waveform / pseudo_waveform.abs().max()
        return pseudo_waveform.squeeze().numpy()
