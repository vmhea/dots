#!/bin/bash

cpdir() {
    mkdir -p "$2" && cp -r "$1" "$2"
}

# copy current dot files
cpdir "$HOME/.config/nvim" "$PWD/.config"                     # neovim
cpdir "$HOME/.config/i3" "$PWD/.config"                       # i3
cpdir "$HOME/.config/picom" "$PWD/.config"                    # picom
cpdir "$HOME/.config/alacritty" "$PWD/.config"                # alacritty
cpdir "$HOME/.config/rofi" "$PWD/.config"                     # rofi
cpdir "$HOME/.local/share/rofi" "$PWD/.local/share"
cpdir "$HOME/.local/bin/rofi-power-menu" "$PWD/.local/bin"
cpdir "$HOME/.config/polybar" "$PWD/.config"                  # polybar
echo "Copied dot files from $HOME to $PWD"

# call git commit and push
git remote set-url origin git@github.com:vmhea/dots.git
git add -A
git commit -a -m "Automated update via commit script"
git push
