# dotfiles

Run:
* `python3 -m pip install --upgrade pynvim`
* `pip install neovim`


And install the following packages:
base-devel curl wget unzip tar gzip npm neovim zsh git kitty

## Nvim

Launch nvim to auto download vim-plug and ignore all errors. Restart nvim and run `:PackerInstall`

List all available language servers with:
`:LspInstallInfo`

Install needed language servers inside vim with
`:LspInstall <language>`
