#!/bin/zsh
PYTHONWARNINGS="ignore:pkg_resources is deprecated as an API:UserWarning" tensorboard --logdir=experiments/lightning_logs/
