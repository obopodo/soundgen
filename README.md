# Sound generation with neural networks

My implementations of audio generative models.

# Architectures

## VAE

Simple VAE which generates one sound at a time. I trained it on a custom dataset which contains 19 chromatic piano notes generated with MaxMSP script.

List of artifacts:

- [Max patch to create dataset](data/tiny_piano/tiny_piano.maxpat)
- [Notebook with model training and experiments](experiments/vae_simple.ipynb)
- [Successful checkpoint](experiments/vae_simple)

# Inspiration sources

1. RAVE: Realtime Audio Variational autoEncoder ([github](https://github.com/acids-ircam/RAVE?tab=readme-ov-file))
2. Valerio Velardo's "Generating Sound with VAEs" ([github](https://github.com/musikalkemist/generating-sound-with-neural-networks/), [YouTube](https://youtube.com/playlist?list=PL-wATfeyAMNpEyENTc-tVH5tfLGKtSWPp&si=IzBffPgI7-nVi4BA))
