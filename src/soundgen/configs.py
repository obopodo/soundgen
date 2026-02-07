import inspect
import json
from dataclasses import asdict, dataclass, field

import yaml


@dataclass
class TrainConfig:
    batch_size: int = 64
    learning_rate: float = 0.001
    num_epochs: int = 100


@dataclass
class VAEConfig:
    # VAE params:
    input_shape: list[int]  # [num_channels, height, width]
    conv_filters_number: list[int]
    conv_kernel_size: list[int]
    conv_strides: list[int]
    latent_space_dim: int = 128
    padding: int = 1
    shape_before_bottleneck: tuple | None = None  # if None - will try to calculate based on conv layers
    # Loss params:
    kl_weight: float = 1.0
    warmup_epochs: int = 0
    autoencode: bool = False

    # def __post_init__(self):
    #     if isinstance(self.shape_before_bottleneck, list):
    #         self.shape_before_bottleneck = tuple(self.shape_before_bottleneck)

    def to_dict(self) -> dict:
        return asdict(self)

    def to_json(self) -> str:
        return json.dumps(self.to_dict(), indent=4)

    @staticmethod
    def _align_with_signature(data: dict) -> dict:
        # check that the keys in data match the dataclass fields
        return {k: data[k] for k in inspect.signature(VAEConfig).parameters}

    @classmethod
    def from_json(cls, path: str) -> "VAEConfig":
        with open(path, "r") as f:
            data = json.load(f)

        data = cls._align_with_signature(data)
        return cls(**data)

    @classmethod
    def from_yaml(cls, path: str) -> "VAEConfig":
        with open(path, "r") as f:
            data = yaml.safe_load(f)

        data = cls._align_with_signature(data)
        return cls(**data)

    def __repr__(self) -> str:
        items = ",\n    ".join(f"{k}={v!r}" for k, v in self.to_dict().items())
        return f"{self.__class__.__name__}(\n    {items}\n)"
