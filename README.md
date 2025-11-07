# dotfiles

Run `./install_packages.sh` to install packages :)

## Nvim

Launch nvim to auto download packer and ignore all errors. Restart nvim and run `:PackerInstall`

List all available language servers with:
`:LspInstallInfo`

Install needed language servers inside vim with
`:LspInstall <language>`

## Games
### 32-bit support (bnet)
Enable `[multilib]` in `/etc/pacman.conf` and install the following packages
```
sudo pacman -S --needed lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader

```
And random utilities
```
sudo pacman -S gamemode lib32-gamemode gamescope
```
Add yourself to the gamemode group to make it work
```
sudo usermod -aG gamemode <user>
```
