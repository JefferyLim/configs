#!/bin/bash

echo "Loading configurations..."

if  [  -f ~/.tmux.conf ];  then
    echo "tmux configuration found, creating backup..."
    mv ~/.tmux.conf ~/.tmux.conf.backup
fi
cp tmux/tmux.conf ~/.tmux.conf

if [ -f ~/.vimrc ]; then
    echo "vim configuration found, creating backup..."
    mv ~/.vimrc ~/.vimrc.backup
fi
cp vim/vimrc ~/.vimrc

if [ -d ~/.config/geany/colorschemes/ ];then
    cp geany/themes/* ~/.config/geany/colorschemes/.
fi

if [ -d ~/.config/geany ];then
    cp geany/*.conf ~/.config/geany/.
fi
