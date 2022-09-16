# dotfiles

Run:
* `python3 -m pip install --upgrade pynvim neovim ueberzug Pillow cairosvg pnglatex plotly kaleido jupyter_client`


And install the following packages:
base-devel curl wget unzip tar gzip npm neovim zsh git kitty

## Nvim

Launch nvim to auto download vim-plug and ignore all errors. Restart nvim and run `:PackerInstall`

### LSP
List all available language servers with:
`:LspInstallInfo`

Install needed language servers inside vim with
`:LspInstall <language>`

### Jupyter
Install whatever needed kernels from https://github.com/jupyter/jupyter/wiki/Jupyter-kernels

Then run :MagmaInit to start using them
