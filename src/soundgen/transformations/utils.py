import numpy as np
import soundfile as sf


def save_audio(waveform: np.ndarray, filepath: str, target_sr: int) -> None:
    sf.write(filepath, waveform, target_sr)
