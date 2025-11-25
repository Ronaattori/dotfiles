# dotfiles

Run the following commands to get most stuff working

```bash
# Install packages and configure what could be scripted
sudo ./install_packages.sh

# Make KDE ask sudo password instead of su
kwriteconfig6 --file kdesurc --group super-user-command --key super-user-command sudo

# Enable periodic SSD trimming
sudo systemctl enable --now fstrim.timer

# Enable local DNS caching
sudo systemctl enable --now systemd-resolved
ln -sf ../run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
```

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
Bottles stuff
```bash
sudo pacman -S flatpak steam gamemode lib32-gamemode
sudo flatpak install bottles mangohud
flatpak override com.usebottles.bottles --user --filesystem=xdg-data/applications
```

And utilities
```
sudo pacman -S wine wine-mono gamemode lib32-gamemode mangohud
```
Add yourself to the gamemode group to make it work
```
sudo usermod -aG gamemode <user>
```

Suggested Lutris global environment variables
|Key|Value|Comment
|---|-----|------|
|`PROTON_ENABLE_WAYLAND` | 1 | Enable GE-Proton native Wayland
|`__GL_THREADED_OPTIMIZATION` | 1 | Enable multi-thread nvidia driver stuff
|`__GL_SHADER_DISK_CACHE` | 1 | Enable shader disk cache
|`__GL_SHADER_DISK_CACHE_PATH` | /home/user/Games/cache | **This folder needs to be created manually**. Path to write shader disk cache to
|`__GL_SHADER_DISK_CACHE_SKIP_CLEANUP` | 1 | Make the disk cache size unlimited
|`DXVK_HUD` | compiler | Show a text on the bottom left when shares are compiling


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
