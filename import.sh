#!/bin/bash

echo "Loading configurations..."

for d in confiig/*; do
    if [ -d "$d" ]; then
        f=`find "$d" -name "import.sh"`
        if [ "$f" ]; then
            source "$f"
        else
            ln -sf "$d" ~/.config/$(basename -- $d)
        fi
        echo "$d"
    fi
done

# Custom shell commands for each dotfiles

## vim
ln -sf dotfiles/vim/vimrc ~/.vimrc
