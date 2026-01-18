class DecoderUpsample(nn.Module):

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
        upsample_mode: str = "nearest",
    ):
        super().__init__()
        self.conv_filters_number = conv_filters_number
        self.conv_kernel_size = conv_kernel_size
        self.conv_strides = conv_strides
        self._num_conv_layers = len(conv_filters_number)
        self.latent_space_dim = latent_space_dim
        self.num_channels = num_channels
        self.input_shape = input_shape
        self.encoder_output_shapes = encoder_output_shapes
        self.padding = padding
        self.upsample_mode = upsample_mode

        self.dense_layer = nn.Linear(latent_space_dim, linear_layer_size)
        self.reshape_layer = nn.Unflatten(1, shape_before_bottleneck)
        self.upsample_conv_layers = self._init_upsample_layers()
        self.sigmoid = nn.Sigmoid()

    def _init_upsample_layers(self) -> nn.Sequential:
        layers = nn.Sequential()
        current_hw = (self.encoder_output_shapes[-1][1], self.encoder_output_shapes[-1][2])

        for i in reversed(range(1, self._num_conv_layers)):
            target_hw = (self.encoder_output_shapes[i - 1][1], self.encoder_output_shapes[i - 1][2])
            layers.append(nn.Upsample(size=target_hw, mode=self.upsample_mode))
            layers.append(
                nn.Conv2d(
                    in_channels=self.conv_filters_number[i],
                    out_channels=self.conv_filters_number[i - 1],
                    kernel_size=self.conv_kernel_size[i],
                    padding=self.padding,
                )
            )
            layers.append(nn.ReLU())
            layers.append(nn.BatchNorm2d(self.conv_filters_number[i - 1]))
            current_hw = target_hw

        final_target_hw = (self.input_shape[1], self.input_shape[2])
        layers.append(nn.Upsample(size=final_target_hw, mode=self.upsample_mode))
        layers.append(
            nn.Conv2d(
                in_channels=self.conv_filters_number[0],
                out_channels=self.num_channels,
                kernel_size=self.conv_kernel_size[0],
                padding=self.padding,
            )
        )
        return layers

    def forward(self, x):
        x = self.dense_layer(x)
        x = self.reshape_layer(x)
        x = self.upsample_conv_layers(x)
        x = self.sigmoid(x)
        return x
