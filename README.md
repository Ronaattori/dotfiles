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

## Audio
### yabridge
```bash
sudo pacman -S reaper yabridge yabridgectl realtime-privileges
sudo usermod -aG realtime <user>
```
First install plugins into some wine prefix normally

Then set environment variables. Might need to change the relative paths to absolutes. I've noticed that some plugins only run under ge-proton wine, so we'll need to change the "global" runner to that

You can adjust the audio latency by reducing `1024` below. Test how low you can go while still hearing sound in reaper
```bash
export WINEPREFIX=~/Games/someprefix
export WINELOADER=~/.local/share/lutris/runners/proton/ge-proton/files/bin/wine
export PIPEWIRE_LATENCY=1024/48000
```

Then add them to yabridge
1. Run `yabridgectl add "<wineprefix_to_installed_vst>/drive_c/Program Files/Common Files/VST3"`
2. Run `yabridgectl sync`

Reaper should now find the plugins through yabridge. You will need to set atleast `WINELOADER` env variable before running reaper
```bash
export WINELOADER=~/.local/share/lutris/runners/proton/ge-proton/files/bin/wine
reaper
```
