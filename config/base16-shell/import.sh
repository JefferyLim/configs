#!/bin/bash

mkdir -p ~/.config/

if [ ! -d ~/.config/base16-shell/ ];then
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi

command='# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
            source "$BASE16_SHELL/profile_helper.sh"
            
    base16_tomorrow-night'

grep -Fq "$command" ~/.bashrc || echo "$command" >> ~/.bashrc 

source ~/.bashrc
