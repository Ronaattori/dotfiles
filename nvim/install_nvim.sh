#!/bin/bash
set -eo pipefail

PACKAGE_NAME="nvim-linux-x86_64.appimage"

function is_installed() {
    dpkg -s "$1" &> /dev/null
    if [ $? -eq 0 ]; then
        return 0
    fi
    return 1
}

function preflight_check() {
    if [ ! -f  "/etc/debian_version" ]; then
        echo This script is only meant for Debian installations
        echo For other distros that I might run, use the package manager
        exit 1
    fi

    if is_installed neovim; then
        echo Please uninstall neovim from apt
        exit 1
    fi
    if is_installed python3-pynvim; then
        echo "Please uninstall python3-pynvim from apt. It needs to be installed through pipx"
        exit 1
    fi

    if ! is_installed pipx; then
        echo "Please install pipx. It's needed to install pynvim"
        exit 1
    fi

    if ! is_installed jq; then
        echo "Please install jq"
        exit 1
    fi
    if ! is_installed fuse; then
        echo "You might also need to install fuse, if nvim doesn't run"
        echo apt install fuse
    fi
}

function check_latest_version() {
    echo $(curl -s "$API_LATEST" | jq -r .tag_name)
}

function download_version() {
    json=$(curl -s "$API_SPECIFIC/$1" | jq)

    if [ "$(echo $json | jq -r .tag_name)" = "null" ]; then
        echo Neovim version $1 not found
        exit 1
    fi

    url=$(echo $json | jq -r '.assets | .[] | select(.name=="'$PACKAGE_NAME'") | .browser_download_url')
    destination="/tmp/nvim.appimage"

    if [ -z $url ]; then
        echo "Neovim release $1 doesn't contain a package called $PACKAGE_NAME"
        exit 1
    fi

    wget -q --show-progress -O $destination $url
}

function install_neovim() {
    preflight_check

    read -p "Download and install Neovim version $1? (y|n) " choice
    case "$choice" in
        y|Y ) echo Installing Neovim...;;
        n|N ) echo "Exiting install..."; exit 0;;
        * ) echo "Exiting install..."; exit 0;;
    esac

    download_version "$1"

    install /tmp/nvim.appimage /usr/local/bin/nvim
    rm /tmp/nvim.appimage
    echo Neovim version $1 installed to /usr/local/sbin/nvim
}



API_LATEST="https://api.github.com/repos/neovim/neovim/releases/latest"
API_SPECIFIC="https://api.github.com/repos/neovim/neovim/releases/tags"

VERSION="$1"
# Get the latest version
if [ -z "$1" ] || [ "$1" = "latest" ]; then
    VERSION=$(check_latest_version)
fi

install_neovim "$VERSION"

