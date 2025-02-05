#!/bin/bash

mkdir -p ~/.config/

if [ ! -d ~/.config/base16-shell/ ];then
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi

command='# Base16 Shell
export BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
            source "$BASE16_SHELL/profile_helper.sh"
            
# Path to the .base16_theme file
BASE16_THEME="$HOME/.base16_theme"

# Check if the file exists
if [ ! -f "$BASE16_THEME" ]; then
    # Place your script to run here, for example:
    base16_tomorrow-night
else
    source $BASE16_THEME
fi'

grep -Fq "$command" ~/.bashrc || echo "$command" >> ~/.bashrc 

. ~/.bashrc
