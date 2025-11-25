#!/usr/bin/env bash

read -r -p "Install the usual system utils? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    pacman -S --needed \
	sddm \
        dunst \
        networkmanager \
        network-manager-applet \
        pipewire \
        wireplumber \
        pavucontrol \
        pipewire-audio \
        pipewire-alsa \
        pipewire-pulse \
        pipewire-jack \
        noto-fonts-cjk \
        ttf-input-nerd \
        ttf-noto-nerd
    
    systemctl enable --now NetworkManager.service
    systemctl enable sddm.service
else
    echo "Skipping system utilities"
fi

read -r -p "Install NVIDIA drivers? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    pacman -S --needed \
	nvidia \
	nvidia-utils \
	nvidia-settings
else
    echo "Skipping NVIDIA drivers"
fi

sudo pacman -S --needed \
    base-devel \
    curl \
    wget \
    git \
    unzip \
    tar \
    htop \
    less \
    gzip \
    npm \
    neovim \
    rofi \
    zsh \
    feh \
    git \
    kitty \
    ripgrep \
    python3 \
    tmux \
    playerctl \
    zsh-syntax-highlighting \
    python-pynvim \
    ttf-firacode-nerd \
    xdotool \
    spectacle \
    i3lock \
    i3 \
    autotiling \
    i3status \
    xclip \
    plasma-desktop \
    plasma-pa \
    kwallet-pam \
    networkmanager-qt \
    kscreen \
    sddm-kcm \
    dolphin

# Disable mouse acceleration on X11
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

# SDDM (and X11) to Finnish keyboard layout
localectl set-x11-keymap fi

# Maybe if I go back to Wayland sometime
# hyprland hyprpaper wofi waybar

