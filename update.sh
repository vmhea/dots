#!/bin/sh

cpdir() {
    mkdir -p "$(dirname "$2")" && cp -r "$1" "$2"
}

git_path="$HOME/git/dots"

echo "Copying files to git directory"

# i3
cpdir "$HOME/.config/i3" "$git_path/.config"

# picom
cpdir "$HOME/.config/picom" "$git_path/.config"

# neovim
cpdir "$HOME/.config/nvim" "$git_path/.config"

# alacritty
cpdir "$HOME/.config/alacritty" "$git_path/.config"
cp "$HOME/tmux.conf" "$git_path/tmux.conf"

# rofi
cpdir "$HOME/.config/rofi" "$git_path/.config"
cpdir "$HOME/.local/share/rofi" "$git_path/.local/share/"

# polybar
cpdir "$HOME/.config/polybar" "$git_path/.config"

echo "Done"
