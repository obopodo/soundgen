from typing import Callable, Literal, Optional

import torch
from torch.nn import Module
from torch.nn.modules.loss import _Loss
from torch.optim import Adam
from torch.utils.data import DataLoader
from torch.utils.tensorboard import SummaryWriter

from soundgen.models.vae import VAE, VAELoss

tb_writer = SummaryWriter()


def train(
    train_func: Callable,
    *,
    num_epochs: int,
    train_loader: DataLoader,
    model: Module,
    loss_fn: _Loss,
    optimizer: Adam,
    device: Literal["cpu", "cuda", "mps"],
    valid_loader: Optional[DataLoader] = None,
    valid_epoch_step: int = 1,
) -> None:
    """Top-level training loop.

    Parameters
    ----------
    train_func : Callable
        Function to train for one epoch.
    num_epochs : int
        Number of epochs to train.
    train_loader : DataLoader
        DataLoader for training data.
    model : Module
        Model to train.
    loss : _Loss
        Loss function.
    optimizer : Adam
        Optimizer.
    device : Literal["cpu", "cuda", "mps"]
        Device to use (e.g., 'cpu', 'cuda').
    valid_loader : Optional[DataLoader]
        DataLoader for validation data.
        If None, validation is skipped.
    valid_epoch_step : int, default=1
        Frequency of validation.
    """
    model.to(device)

    for epoch in range(1, num_epochs + 1):
        avg_loss = train_func(train_loader, model, loss_fn, optimizer, device)
        tb_writer.add_scalar("Training Loss", avg_loss, epoch)
        # print(f"Epoch {epoch}, Average Loss: {avg_loss:.6f}")

        if epoch % valid_epoch_step == valid_epoch_step - 1:
            if valid_loader is not None:
                model.eval()
                valid_loss = 0
                with torch.no_grad():
                    for X, _ in valid_loader:
                        X = X.to(device)
                        X_reconstructed, mu, logvar = model(X)
                        loss = loss_fn(X_reconstructed, X, mu, logvar)
                        valid_loss += loss.item()
                avg_valid_loss = valid_loss / len(valid_loader.dataset)
                tb_writer.add_scalar("Validation Loss", avg_valid_loss, epoch)
                # print(f"--- Validation Loss: {avg_valid_loss:.6f}")


def train_one_epoch_vae(
    train_loader: DataLoader,
    model: VAE,
    loss_fn: VAELoss,
    optimizer: Adam,
    device: Literal["cpu", "cuda", "mps"],
) -> float:
    """Train VAE for one epoch."""
    model.train()
    train_loss = 0
    for batch_idx, (X, _) in enumerate(train_loader):
        X = X.to(device)
        optimizer.zero_grad()
        X_reconstructed, mu, logvar = model(X)
        loss = loss_fn(X_reconstructed, X, mu, logvar)
        loss.backward()
        train_loss += loss.item()
        optimizer.step()
        # TODO: add intermediate loss logging to tb_writer
    avg_loss = train_loss / len(train_loader.dataset)
    return avg_loss
