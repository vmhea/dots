#!/bin/bash

cpdir() {
    mkdir -p "$2" && cp "$1" "$2"
}

apps="neovim alacritty i3-gaps feh rofi picom"
repos=("ppa:neovim-ppa/stable" "ppa:aslatter/ppa" "ppa:regolith-linux/release")

echo "Import script started"

echo "Adding required apt repositories"
for str in "${repos[@]}"
    do
        sudo add-apt-repository -y $str
    done
sudo apt-get update
echo "Done"

echo "Installing required applications"
sudo apt-get install -y $apps
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sudo apt install -y i3-gaps
echo "Done"

echo "Installing JetBrains Mono to $HOME/.local/share/fonts"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
mkdir "fonts" && unzip JetBrainsMono.zip -x "*Windows*" -d "fonts"
cpdir "fonts" "$HOME/.local/share"
rm "JetBrainsMono.zip" && rm -rf "fonts"
fc-cache -f -v
echo "Done"

echo "Copying dot files to $HOME"
cpdir ".local" "$HOME"
cpdir ".config" "$HOME"
cp "tmux.conf" "$HOME"
cp "assets" "$HOME/Pictures/wallpapers"
echo "Done"

echo "Installing polybar"
sudo apt install -y build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
git clone --recursive https://github.com/polybar/polybar
mkdir polybar/build && cd polybar/build
cmake ..
make -j$(nproc)
sudo make install
cd ../.. && rm -rf "polybar"
echo "Done"

echo "Import script finished"
echo "Run nvim and perform :PackerInstall"
