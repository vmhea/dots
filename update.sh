#!/bin/bash

cpdir() {
    mkdir -p "$2" && cp -r "$1" "$2"
}

# copy current files from directories
# neovim
cpdir "$HOME/.config/nvim" "$PWD/.config"

# i3
cpdir "$HOME/.config/i3" "$PWD/.config"

# picom
cpdir "$HOME/.config/picom" "$PWD/.config"

# alacritty
cpdir  "$HOME/.config/alacritty" "$PWD/.config"
cp "$HOME/tmux.conf" "$PWD"

# rofi
cpdir "$HOME/.config/rofi" "$PWD/.config"
cpdir "$HOME/.local/share/rofi" "$PWD/.local/share"

# polybar
cpdir "$HOME/.config/polybar" "$PWD/.config"

# call git commit and push
git remote set-url origin git@github.com:vmhea/dots.git
git add -A
git commit -a -m "Automated update via commit script"
git push
