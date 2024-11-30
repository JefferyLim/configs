#!/bin/bash

echo "Loading configurations..."

mkdir -p ~/.config

for d in dotconfig/*; do
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
## vim
mkdir -p ~/.vim/colors
git clone https://github.com/chriskempson/base16-vim.git ~/.vim/colors/base16
cp ~/.vim/colors/base16/colors/*.vim ~/.vim/colors/.
ln -sf "$PWD/dotfile/vim/vimrc" ~/.vimrc

