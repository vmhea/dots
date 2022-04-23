#!/bin/bash

cpdir() {
    mkdir -p "$2" && cp "$1" "$2"
}

echo "Copying dot files to $HOME"
cpdir ".local" "$HOME"
cpdir ".config" "$HOME"
echo "Done"
