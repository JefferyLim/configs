#!/bin/bash

echo "Loading configurations..."

mkdir -p ~/.config

for d in config/*; do
    if [ -d "$d" ]; then
        f=`find "$d" -name "import.sh"`
        if [ "$f" ]; then
            source "$f"
        else
            ln -sf ~/.config/$(basename -- $d) "$PWD/$d"
        fi
        echo "$d"
    fi
done

# Custom shell commands for each dotfiles
## .profile
BLOCK='
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
'

PROFILE="$HOME/.profile"
# Check if the block already exists in .profile
if ! grep -Fxq "$BLOCK" "$PROFILE"; then
    echo "Adding the block to $PROFILE"
    echo "$BLOCK" >> "$PROFILE"
else
    echo "Block already exists in $PROFILE"
fi

## .vim
mkdir -p ~/.vim/colors
git clone https://github.com/chriskempson/base16-vim.git ~/.vim/colors/base16
cp ~/.vim/colors/base16/colors/*.vim ~/.vim/colors/.
ln -sf "$PWD/file/vim/vimrc" ~/.vimrc

