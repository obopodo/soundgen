import random
from typing import Literal

import torch
from torch import Tensor
from torchaudio.transforms import Fade, PitchShift, TimeMasking, TimeStretch


def pitchshift(waveform: Tensor, sample_rate: int, shift_semitones: int = 2) -> Tensor:
    """
    Pitch Shift (PS): randomly raises or lowers the pitch of the audio signal.\n
    Based on experimental observation,we found the range of pitch shifts that main-tained\n
    the overall coherency of the input audio was in the range [-15, 15] semitones.

    Parameters
    ----------
    waveform: Tensor[C, T]
        Audio waveform.
    sample_rate: int
        The sample rate of this waveform.
    shift_semitones: int, optional
        Number of semitones to shift the pitch, by default 2.
        Best results are achieved by randomly selecting the shift value from the range [-15, 15].
    Returns
    -------
    Tensor[C, T]
        Pitch-shifted audio waveform.
    """
    assert waveform != None, "audio should not be None"
    transform = PitchShift(sample_rate=sample_rate, n_steps=shift_semitones)
    waveform_shift = transform(waveform)
    return waveform_shift


def fade_in_out(waveform: Tensor, fade_shape: Literal["linear", "logarithmic", "exponential"] = None) -> Tensor:
    """
    Fade in/out (FD): gradually increases/decreases the intensity of the audio in the
    beginning/end of the audio signal.

    Parameters
    ----------
    waveform: Tensor[C, T]
        Audio waveform.
    fade_shape: Literal["linear", "logarithmic", "exponential"], optional
        Shape of the fade, by default None.
        if not specified, applied one of ["linear", "logarithmic", "exponential"] with uniform probability of 1/3.

    The size of the fade for either side of the audio signal could at maximum reach half of the audio signal. The size of the
    fade is a random parameter picked for each sample.

    Returns
    -------
    Tensor[C, T]
        Faded audio waveform.
    """

    if fade_shape is None:
        fade_shape = random.choice(["linear", "logarithmic", "exponential"])

    fade_sizes = [i for i in range(1, int(waveform.shape[2] / 2))]

    transform = Fade(
        fade_in_len=random.choice(fade_sizes),
        fade_out_len=random.choice(fade_sizes),
        fade_shape=fade_shape,
    )
    waveform_fade_in_out = transform(waveform)
    return waveform_fade_in_out


def add_white_noise(waveform, noise_level: float):
    """Mix the audio signal with white noise."""
    noise = torch.randn_like(waveform) * torch.std(waveform) * noise_level
    noisy_signal = waveform + noise
    return noisy_signal


def time_masking(waveform, batch_size, sample_rate=16000):
    """
    Time masking:given an audio signal, in this transformation we randomly select a small\n
    segment of the full signal and set the signal values in that segment to normal noise or a\n
    constant value. In our implementation, we not only randomly selected the location of the\n
    masked segment but also we randomly selected the size of the segment. The size of the \n
    masked segment was set to maximally be 1/8 of the input signal.
    """
    """max_mask = int(sample_rate/8)*torch.ones(size=[batch_size])
    pos_iniziale = torch.randint(low=0, high=sample_rate, size=[batch_size])
    min_mask = sample_rate-pos_iniziale
    min_elements = torch.min(min_mask,max_mask)
    pos_finale = pos_iniziale+min_elements.to(torch.int)
    indices = torch.arange(sample_rate).unsqueeze(0).expand(batch_size, -1)
    range_mask = (indices >= pos_iniziale.unsqueeze(1)) & (indices <= pos_finale.unsqueeze(1))
    range_mask = range_mask[:,None,:]
    signal_[range_mask] = 0

    return signal_"""
    bs, ch, length = waveform.shape
    mask_len = length // 8
    augmented = waveform.clone()
    for i in range(bs):
        start = random.randint(0, length - mask_len)
        augmented[i, :, start : start + mask_len] = 0.0
    return augmented


def time_stretching(waveform, rate=1.2):
    """
    slows down or speeds up the audio sample (while keeping the pitch unchanged).
    In this approach we transformed the signal by first computing the STFT of the signal, stretching
    it using a phase vocoder, and computing the inverse STFT to reconstruct the time domain signal.
    Following those transformations, we down-sampled or cropped the signal to match the same number
    of samples as the input signal. When the rate of stretching was greater than 1, the signal was
    sped up. Otherwise when the rate of stretching was less than 1, then the signal was slowed down.
    The rate of time stretching was randomized for each audio with range values of [0.5, 1.5].
    """
    stretcher = TimeStretch()
    return stretcher(waveform, overriding_rate=rate)
