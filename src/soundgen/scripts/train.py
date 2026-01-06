from abc import ABC, abstractmethod
from pathlib import Path
from typing import Literal, Optional

import torch
from torch.nn import Module
from torch.nn.modules.loss import _Loss
from torch.optim import Adam
from torch.utils.data import DataLoader
from torch.utils.tensorboard import SummaryWriter
from tqdm import tqdm

from soundgen.models.vae import VAE, VAELoss


class BaseTrainer(ABC):
    def __init__(
        self,
        train_loader: DataLoader,
        model: Module,
        loss_fn: _Loss,
        optimizer: Adam,
        device: Literal["cpu", "cuda", "mps"],
        valid_loader: Optional[DataLoader] = None,
        valid_epoch_step: int = 1,
        tb_writer: Optional[SummaryWriter] = None,
    ):
        """Train models.

        Parameters
        ----------
        train_func : Callable
            Function to train for one epoch.
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
        tb_writer : Optional[SummaryWriter] = None
            TensorBoard SummaryWriter for logging.
        """
        self.train_loader = train_loader
        self.model = model
        self.loss_fn = loss_fn
        self.optimizer = optimizer
        self.device = device
        self.valid_loader = valid_loader
        self.valid_epoch_step = valid_epoch_step
        self.tb_writer = tb_writer
        if tb_writer is None:
            self.tb_writer = SummaryWriter(Path(__file__).parent.parent.parent.parent / "logs")

    def train(self, num_epochs: int) -> None:
        """Top level training loop."""
        self.model.to(self.device)

        for epoch in tqdm(range(1, num_epochs + 1), total=num_epochs, desc="Epoch"):
            avg_loss = self.train_one_epoch()
            self.tb_writer.add_scalar("Training Loss", avg_loss, epoch)

            if epoch % self.valid_epoch_step == self.valid_epoch_step - 1:
                if self.valid_loader is not None:
                    self.model.eval()
                    valid_loss = 0
                    with torch.no_grad():
                        for X, *_ in self.valid_loader:
                            X = X.to(self.device)
                            X_reconstructed, mu, logvar = self.model(X)
                            loss = self.loss_fn(X_reconstructed, X, mu, logvar)
                            valid_loss += loss.item()
                    avg_valid_loss = valid_loss / len(self.valid_loader.dataset)
                    self.tb_writer.add_scalar("Validation Loss", avg_valid_loss, epoch)
                    # print(f"--- Validation Loss: {avg_valid_loss:.6f}")

    @abstractmethod
    def train_one_epoch(self):
        pass


class VAETrainer(BaseTrainer):
    def train_one_epoch(self) -> float:
        """Train VAE for one epoch."""
        self.model: VAE
        self.loss_fn: VAELoss
        self.model.train()
        train_loss = 0
        for batch_idx, (X, sr, label) in enumerate(self.train_loader):
            X = X.to(self.device)
            self.optimizer.zero_grad()
            X_reconstructed = self.model(X)
            loss = self.loss_fn(
                X_reconstructed,
                X,
                self.model._mu,
                self.model._log_var,
                100,
            )
            loss.backward()
            train_loss += loss.item()
            self.optimizer.step()
            # TODO: add intermediate loss logging to tb_writer
        avg_loss = train_loss / len(self.train_loader.dataset)
        return avg_loss


if __name__ == "__main__":
    print(Path(__file__).parent.parent.parent)
