import numpy as np
from torch import Tensor, nn
from torchaudio.transforms import GriffinLim, InverseMelScale


class MelToWaveformTransform(nn.Module):

    def __init__(
        self,
        *,
        sample_rate: int,
        n_fft: int,
        n_mels: int,
        s_min: float = 0.0,
        s_max: float = 5500.0,
        power: float = 1.0,
        hop_length: int | None = None,
        win_length: int | None = None,
        griffin_lim_n_iter: int = 64,
    ):
        super().__init__()
        self.invers_transform = InverseMelScale(
            sample_rate=sample_rate,
            n_stft=n_fft // 2 + 1,
            n_mels=n_mels,
        )
        self.grifflim_transform = GriffinLim(
            n_fft=n_fft,
            n_iter=griffin_lim_n_iter,
            win_length=win_length,
            hop_length=hop_length,
            power=power,
        )
        self.s_min = s_min
        self.s_max = s_max

    def forward(self, mel_spectrogram: Tensor) -> np.ndarray:
        mel_spectrogram = mel_spectrogram.clamp(min=0)
        mel_spectrogram = mel_spectrogram * (self.s_max - self.s_min) + self.s_min
        inverse_waveform = self.invers_transform(mel_spectrogram)
        pseudo_waveform: Tensor = self.grifflim_transform(inverse_waveform)
        peak = pseudo_waveform.abs().max()
        if peak > 0:
            pseudo_waveform = pseudo_waveform / peak
        return pseudo_waveform.squeeze().numpy()


class SpectrogramToWaveformTransform(nn.Module):
    """Invert a *linear-frequency magnitude* spectrogram to waveform.

    This avoids mel/inverse-mel entirely: you train the model to output a linear STFT magnitude
    spectrogram, then use Griffin-Lim to estimate phase.
    """

    def __init__(
        self,
        *,
        n_fft: int,
        power: float = 1.0,
        hop_length: int | None = None,
        win_length: int | None = None,
        griffin_lim_n_iter: int = 64,
        griffin_lim_momentum: float = 0.99,
        griffin_lim_rand_init: bool = True,
        s_min: float = 0.0,
        s_max: float = 1.0,
    ):
        super().__init__()
        self.s_min = s_min
        self.s_max = s_max
        self.grifflim_transform = GriffinLim(
            n_fft=n_fft,
            n_iter=griffin_lim_n_iter,
            win_length=win_length,
            hop_length=hop_length,
            power=power,
            momentum=griffin_lim_momentum,
            rand_init=griffin_lim_rand_init,
        )

    def forward(self, spectrogram: Tensor) -> np.ndarray:
        # de-normalize back to original magnitude scale
        spectrogram = spectrogram.clamp(min=0)
        spectrogram = spectrogram * (self.s_max - self.s_min) + self.s_min

        pseudo_waveform: Tensor = self.grifflim_transform(spectrogram)
        peak = pseudo_waveform.abs().max()
        if peak > 0:
            pseudo_waveform = pseudo_waveform / peak
        return pseudo_waveform.squeeze().numpy()
