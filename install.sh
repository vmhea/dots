#!/bin/sh

cpdir() {
    mkdir -p "$(dirname "$2")" && cp -r "$1" "$2"
}

apps="neovim alacritty i3-gaps feh rofi"

echo "Adding required apt repositories"
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo add-apt-repository -y ppa:aslatter/ppa
sudo add-apt-repository -y ppa:regolith-linux/release
sudo apt-get update
echo "Done"

echo "Installing required applications"
sudo apt-get install -y $apps
echo "Done"

echo "Copying files to $HOME"
cpdir ".local" "$HOME/.local"
cpdir ".config" "$HOME/.config"
cp "tmux.conf" "$HOME/tmux.conf"
echo "Done"

echo "Downloading and copying JetBrains Mono to .fonts"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
mkdir ".fonts"
unzip JetBrainsMono.zip -x "*Windows*" -d ".fonts"
cpdir ".fonts" "$HOME/.fonts"
fc-cache -fv
rm "JetBrainsMono.zip" && rm ".fonts"
echo "Done"

echo "Downloading and compiling polybar"
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
echo "Done"

