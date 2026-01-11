import json
import logging
from pathlib import Path

import lightning as L
import numpy as np
import torch
from torch import nn
from torch.optim import Adam
from torchinfo import summary

from soundgen.configs import VAEConfig
from soundgen.models.utils import calculate_conv2d_output_shape, get_device

DEBUG_CONVOLUTIONS = False

logger = logging.getLogger(__name__)
if not logger.hasHandlers():
    logger.setLevel(logging.INFO)
    filename = Path(__file__).parent.parent.parent / "vae_loss.log"
    fh = logging.FileHandler(filename)
    formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s")
    fh.setFormatter(formatter)
    logger.addHandler(fh)


class Encoder(nn.Module):

    def __init__(
        self,
        input_shape: int,
        conv_filters_number: list[int],
        conv_kernel_size: list[int],
        conv_strides: list[int],
        latent_space_dim: int,
        padding: int = 1,
        output_shape=None,
    ):
        super().__init__()
        self.input_shape = input_shape  # [num_channels, height, width]
        self.num_channels = input_shape[0]
        self.conv_filters_number = conv_filters_number  # number of filters in each conv layer, eg [2, 4, 8]
        self.conv_kernel_size = conv_kernel_size  # kernel size for each conv layer, eg [3, 5, 3]
        self.conv_strides = conv_strides  # stride for each conv layer, eg [1, 2, 2]
        self.latent_space_dim = latent_space_dim
        self.padding = padding

        self._num_conv_layers = len(conv_filters_number)
        self.conv_output_shapes = self._compute_conv_output_shapes()
        # allow overriding the bottleneck shape if provided (e.g. loaded from config)
        self.shape_before_bottleneck = output_shape if output_shape is not None else self.conv_output_shapes[-1]
        if isinstance(self.shape_before_bottleneck, list):
            self.shape_before_bottleneck = tuple(self.shape_before_bottleneck)
        # size of the flattened layer after convolutions
        self.linear_layer_size = np.prod(self.shape_before_bottleneck)

        self.mu = nn.Linear(self.linear_layer_size, self.latent_space_dim)
        self.log_var = nn.Linear(self.linear_layer_size, self.latent_space_dim)
        self.conv_layers = self._init_convolutions()
        self.flatten = nn.Flatten()

    def _compute_conv_output_shapes(self) -> list[tuple[int, int, int]]:
        """Pre-compute spatial shapes for each conv layer in the encoder."""
        size = self.input_shape[-2:]
        shapes: list[tuple[int, int, int]] = []
        for out_channels, kernel_size, stride in zip(
            self.conv_filters_number, self.conv_kernel_size, self.conv_strides
        ):
            size = calculate_conv2d_output_shape(size, kernel_size, padding=self.padding, stride=stride)
            shapes.append((out_channels, size[0], size[1]))
        return shapes

    def _init_convolutions(self) -> nn.Sequential:
        conv_layers = nn.Sequential()
        for i in range(self._num_conv_layers):
            if i == 0:
                in_channels = self.num_channels
            else:
                in_channels = self.conv_filters_number[i - 1]

            conv_layers.append(
                nn.Conv2d(
                    in_channels=in_channels,
                    out_channels=self.conv_filters_number[i],
                    kernel_size=self.conv_kernel_size[i],
                    stride=self.conv_strides[i],
                    padding=self.padding,
                )
            )
            conv_layers.append(nn.BatchNorm2d(self.conv_filters_number[i]))
            conv_layers.append(nn.ReLU())

        return conv_layers

    def forward(self, x):
        x = self.conv_layers(x)
        if DEBUG_CONVOLUTIONS:
            print("### SHAPE AFTER CONVOLUTIONS:", x.shape)
        x = self.flatten(x)
        means = self.mu(x)
        log_vars = self.log_var(x)
        return means, log_vars


class Decoder(nn.Module):

    def __init__(
        self,
        latent_space_dim: int,
        shape_before_bottleneck: tuple,
        linear_layer_size: int,
        conv_filters_number: list[int],
        conv_kernel_size: list[int],
        conv_strides: list[int],
        num_channels: int,
        input_shape: list[int],
        encoder_output_shapes: list[tuple[int, int, int]],
        padding: int = 1,
    ):
        super().__init__()

        self.conv_filters_number = conv_filters_number  # number of filters in each conv layer, eg [2, 4, 8]
        self.conv_kernel_size = conv_kernel_size  # kernel size for each conv layer, eg [3, 5, 3]
        self.conv_strides = conv_strides  # stride for each conv layer, eg [1, 2, 2]
        self._num_conv_layers = len(conv_filters_number)
        self.latent_space_dim = latent_space_dim
        self.num_channels = num_channels
        self.input_shape = input_shape
        self.encoder_output_shapes = encoder_output_shapes
        self.padding = padding

        self.dense_layer = nn.Linear(latent_space_dim, linear_layer_size)
        self.reshape_layer = nn.Unflatten(1, shape_before_bottleneck)
        self.conv_transpose_layers = self._init_conv_transpose_layers()
        self.sigmoid = nn.Sigmoid()

    def _init_conv_transpose_layers(self) -> nn.Sequential:
        """Loop through the conv layers in reverse order and mirror encoder shapes."""
        conv_transpose_layers = nn.Sequential()
        current_hw = (self.encoder_output_shapes[-1][1], self.encoder_output_shapes[-1][2])

        for i in reversed(range(1, self._num_conv_layers)):
            target_hw = (self.encoder_output_shapes[i - 1][1], self.encoder_output_shapes[i - 1][2])
            output_padding = self._calculate_output_padding(
                current_hw,
                target_hw,
                self.conv_kernel_size[i],
                self.conv_strides[i],
                self.padding,
            )
            conv_transpose_layers.append(
                nn.ConvTranspose2d(
                    in_channels=self.conv_filters_number[i],  # ?
                    out_channels=self.conv_filters_number[i - 1],  # ?
                    kernel_size=self.conv_kernel_size[i],
                    stride=self.conv_strides[i],
                    padding=self.padding,
                    output_padding=output_padding,
                )
                # output padding is used to ensure the output shape matches the input shape
                # IDK how to calculate the exact value, 1 just worked for stride equal to 1 and 2
            )

            conv_transpose_layers.append(nn.ReLU())
            conv_transpose_layers.append(nn.BatchNorm2d(self.conv_filters_number[i - 1]))
            current_hw = target_hw

        # Add the last conv transpose layer to get back to the original number of channels
        final_target_hw = (self.input_shape[1], self.input_shape[2])
        output_padding = self._calculate_output_padding(
            current_hw,
            final_target_hw,
            self.conv_kernel_size[0],
            self.conv_strides[0],
            self.padding,
        )
        conv_transpose_layers.append(
            nn.ConvTranspose2d(
                in_channels=self.conv_filters_number[0],
                out_channels=self.num_channels,
                kernel_size=self.conv_kernel_size[0],
                stride=self.conv_strides[0],
                padding=self.padding,
                output_padding=output_padding,
            )
        )
        return conv_transpose_layers

    @staticmethod
    def _calculate_output_padding(
        input_hw: tuple[int, int],
        target_hw: tuple[int, int],
        kernel_size: int,
        stride: int,
        padding: int,
    ) -> tuple[int, int]:
        """Compute output_padding that exactly matches the target spatial size."""

        def dim_padding(input_size: int, target_size: int) -> int:
            pad = target_size - ((input_size - 1) * stride - 2 * padding + kernel_size)
            if pad < 0 or pad >= stride:
                raise ValueError(
                    f"Invalid output padding computed: pad={pad}, input={input_size}, target={target_size}, "
                    f"stride={stride}, kernel={kernel_size}, padding={padding}"
                )
            return pad

        return dim_padding(input_hw[0], target_hw[0]), dim_padding(input_hw[1], target_hw[1])

    def forward(self, x):
        x = self.dense_layer(x)
        x = self.reshape_layer(x)
        x = self.conv_transpose_layers(x)
        x = self.sigmoid(x)
        return x


class DecoderUpsample(Decoder):
    """Another decoder implementation using upsampling + conv layers.

    This should be a bit better as it avoids checkerboard artifacts from transposed convolutions.
    """

    def _init_conv_transpose_layers(self) -> nn.Sequential:
        """Mirror encoder shapes using nearest-neighbor upsample + SAME conv to avoid shrinkage."""
        conv_transpose_layers = nn.Sequential()

        for i in reversed(range(1, self._num_conv_layers)):
            target_hw = (self.encoder_output_shapes[i - 1][1], self.encoder_output_shapes[i - 1][2])
            conv_transpose_layers.append(nn.Upsample(size=target_hw, mode="nearest"))
            conv_transpose_layers.append(
                nn.Conv2d(
                    in_channels=self.conv_filters_number[i],
                    out_channels=self.conv_filters_number[i - 1],
                    kernel_size=self.conv_kernel_size[i],
                    padding="same",
                )
            )
            conv_transpose_layers.append(nn.ReLU())
            conv_transpose_layers.append(nn.BatchNorm2d(self.conv_filters_number[i - 1]))

        # Final upsample + conv to recover original channel count and spatial size
        final_target_hw = (self.input_shape[1], self.input_shape[2])
        conv_transpose_layers.append(nn.Upsample(size=final_target_hw, mode="nearest"))
        conv_transpose_layers.append(
            nn.Conv2d(
                in_channels=self.conv_filters_number[0],
                out_channels=self.num_channels,
                kernel_size=self.conv_kernel_size[0],
                padding="same",
            )
        )
        return conv_transpose_layers


class VAE(nn.Module):

    def __init__(
        self,
        input_shape: list[int],
        conv_filters_number: list[int],
        conv_kernel_size: list[int],
        conv_strides: list[int],
        latent_space_dim: int,
        padding: int = 1,
        shape_before_bottleneck=None,
        use_transpose_decoder: bool = False,
    ):
        super().__init__()
        self._mu = None
        self._log_var = None
        self.input_shape = input_shape  # [num_channels, height, width]
        self.num_channels = input_shape[0]
        self.conv_filters_number = conv_filters_number  # number of filters in each conv layer, eg [2, 4, 8]
        self.conv_kernel_size = conv_kernel_size  # kernel size for each conv layer, eg [3, 5, 3]
        self.conv_strides = conv_strides  # stride for each conv layer, eg [1, 2, 2]
        self.latent_space_dim = latent_space_dim
        self.padding = padding

        self.encoder = Encoder(
            input_shape=input_shape,
            conv_filters_number=conv_filters_number,
            conv_kernel_size=conv_kernel_size,
            conv_strides=conv_strides,
            latent_space_dim=latent_space_dim,
            padding=padding,
            output_shape=shape_before_bottleneck,
        )
        DecoderClass = Decoder if use_transpose_decoder else DecoderUpsample
        self.decoder = DecoderClass(
            latent_space_dim=latent_space_dim,
            shape_before_bottleneck=self.encoder.shape_before_bottleneck,
            linear_layer_size=self.encoder.linear_layer_size,
            conv_filters_number=conv_filters_number,
            conv_kernel_size=conv_kernel_size,
            conv_strides=conv_strides,
            num_channels=self.num_channels,
            input_shape=input_shape,
            encoder_output_shapes=self.encoder.conv_output_shapes,
            padding=padding,
        )

    def forward(self, x):
        self._mu, self._log_var = self.encoder(x)
        x = self.reparameterize(self._mu, self._log_var)
        x = self.decoder(x)
        return x

    def reparameterize(self, mu, log_var):
        epsilon = torch.randn_like(log_var)  # .to(DEVICE)
        z = mu + torch.exp(log_var / 2) * epsilon  # reparameterization trick
        return z

    def save(self, weights_path: str, params_path: str):
        self.save_parameters(params_path)
        torch.save(self.state_dict(), weights_path)

    def save_weights(self, weights_path: str):
        torch.save(self.state_dict(), weights_path)

    def save_parameters(self, params_path: str):
        params = {
            "input_shape": self.input_shape,
            "conv_filters_number": self.conv_filters_number,
            "conv_kernel_size": self.conv_kernel_size,
            "conv_strides": self.conv_strides,
            "latent_space_dim": self.latent_space_dim,
            "padding": self.padding,
        }
        with open(params_path, "w") as f:
            json.dump(params, f, indent=4)

    @classmethod
    def load(cls, weights_path: str, params_path: str):
        with open(params_path, "r") as f:
            params = json.load(f)
        model = cls(**params)
        model.load_state_dict(torch.load(weights_path))
        return model


class VAELoss(nn.Module):

    def __init__(
        self,
        kl_weight: float = 1.0,
        warmup_epochs: int = 20,
    ):
        super().__init__()
        self.kl_weight = kl_weight
        self.warmup_epochs = warmup_epochs

    def forward(self, X, X_reconstructed, mu, log_var, epoch: int) -> torch.Tensor:
        """Calculate VAE loss as a sum of reconstruction loss (MSE) and KL divergence."""
        # reconstruction_loss = nn.functional.mse_loss(X, X_reconstructed, reduction="mean")
        reconstruction_loss = nn.functional.l1_loss(X, X_reconstructed, reduction="mean")
        kl_divergence = -0.5 * torch.mean(1 + log_var - mu.pow(2) - log_var.exp())
        denom = max(1, int(self.warmup_epochs))
        kl_beta = max(0.0, min(1.0, (float(epoch) - 1.0) / denom))
        logger.info(
            f"Epoch {epoch} | MSE: {reconstruction_loss.item()} | KLD: {kl_divergence.item()} | Beta: {kl_beta}"
        )
        return reconstruction_loss + kl_beta * self.kl_weight * kl_divergence


class VAELit(L.LightningModule):
    """Lightning wrapper for VAE model.

    Implements training step and optimizer configuration.
    """

    def __init__(
        self,
        input_shape: list[int],
        conv_filters_number: list[int],
        conv_kernel_size: list[int],
        conv_strides: list[int],
        latent_space_dim: int,
        padding: int = 1,
        shape_before_bottleneck=None,
        use_transpose_decoder: bool = False,
        warmup_epochs: int = 0,
        kl_weight: float = 1.0,
        learning_rate: float = 1e-3,
    ):
        super().__init__()
        self.save_hyperparameters()
        self.model = VAE(
            input_shape=input_shape,
            conv_filters_number=conv_filters_number,
            conv_kernel_size=conv_kernel_size,
            conv_strides=conv_strides,
            latent_space_dim=latent_space_dim,
            padding=padding,
            shape_before_bottleneck=shape_before_bottleneck,
            use_transpose_decoder=use_transpose_decoder,
        )
        self.loss_fn = VAELoss(
            kl_weight=kl_weight,
            warmup_epochs=warmup_epochs,
        )
        self.learning_rate = learning_rate

    def training_step(self, batch, batch_idx) -> float:
        """Train VAE on a single batch."""
        X, sr, label = batch
        mu, log_var = self.model.encoder(X)
        log_var = log_var.clamp(min=-10, max=10)
        z = self.model.reparameterize(mu, log_var)
        X_reconstructed = self.model.decoder(z)
        loss = self.loss_fn(
            X,
            X_reconstructed,
            mu,
            log_var,
            self.current_epoch + 1,
        )
        self.log("train_loss", loss)
        return loss

    def configure_optimizers(self):
        optimizer = Adam(self.parameters(), lr=self.learning_rate)
        return optimizer


if __name__ == "__main__":
    DEBUG_CONVOLUTIONS = True

    config = {
        "input_shape": [1, 60, 87],
        "conv_filters_number": [128, 64, 32, 32, 16],
        "conv_kernel_size": [4, 4, 4, 3, 3],
        "conv_strides": [2, 2, 2, 1, 1],
        "latent_space_dim": 32,
        "shape_before_bottleneck": [16, 7, 10],
    }

    model = VAE(**config)
    device = get_device()
    model = model.to(device)
    summary(model, input_size=[1] + config["input_shape"])
