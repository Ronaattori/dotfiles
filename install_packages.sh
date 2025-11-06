#!/usr/bin/env bash
sudo pacman -S --needed \
    base-devel \
    curl \
    wget \
    git \
    unzip \
    tar \
    htop \
    gzip \
    npm \
    neovim \
    rofi \
    zsh \
    git \
    kitty \
    ripgrep \
    python3 \
    tmux \
    zsh-syntax-highlighting \
    python-pynvim \
    ttf-firacode-nerd \
    xdotool \
    spectacle \
    i3lock \
    i3status \
    xclip




# Disable mouse acceleration
cat > /etc/X11/xorg.conf.d/40-libinput.conf <<EOL
Section "InputClass"
    Identifier "libinput pointer catchall"
    MatchIsPointer "on"
    MatchDevicePath "/dev/input/event*"
    Driver "libinput"
    Option "AccelProfile" "flat"
EndSection
EOL

# Enable colors in Pacman (and yay)
sed -i 's/#Color/Color/' /etc/pacman.conf

read -r -p "Install the usual system utils? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    pacman -S --needed \
        dunst \
        networkmanager \
        network-manager-applet \
        pipewire \
        wireplumber \
        pavucontrol \
        pipewire-audio \
        pipewire-alsa \
        pipewire-pulse \
        pipewire-jack
    
    systemctl enable --now NetworkManager.service
else
    echo "Skipping system utilities"
fi




# Maybe if I go back to Wayland sometime
# hyprland hyprpaper wofi waybar

