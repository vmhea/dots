#!/bin/bash

cpdir() {
    mkdir -p "$2" && cp -r "$1" "$2"
}

apps="neovim alacritty feh picom i3 rofi polybar maim xclip ripgrep fd-find unclutter-xfixes npm tree"
repos=("mozillateam/ppa" "neovim-ppa/unstable" "aslatter/ppa")
lsps="pyright bash-language-server vscode-langservers-extracted"


echo "Fresh install script started"

# Remove snap installation of Firefox
sudo snap remove firefox --purge

# Prioritize Firefox PPA over snap
cat <<EOF | sudo tee /etc/apt/preferences.d/mozillateamppa
# Prioritize mozillateam repository over snap for Firefox.

Package: firefox
Pin: release o=Ubuntu,a=jammy,n=jammy,l=Ubuntu,c=main
Pin-Priority: -1

Package: firefox*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 500
EOF

# Add external repositories
for str in "${repos[@]}"
  do
    sudo add-apt-repository -y "ppa:$str"
  done

# Install applications
sudo apt update
sudo apt install -yt 'o=LP-PPA-mozillateam' firefox
sudo apt install -y $apps

# Install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install LSPs for nvim
sudo npm i -g $lsps

# Install JetBrainsMono Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
mkdir "fonts" && unzip JetBrainsMono.zip -x "*Windows*" -d "fonts"
cpdir "fonts" "$HOME/.local/share"
rm "JetBrainsMono.zip" && rm -rf "fonts"
fc-cache -fv

# Copying dot files
cpdir ".local" "$HOME"
cpdir ".config" "$HOME"

# Build from source here


echo "Fresh install script finished"
