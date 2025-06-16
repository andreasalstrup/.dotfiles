#!/bin/bash

DEPENDENCIES=(
        "sed"
        "stow"
        "tmux"
        "clang"
        "rofi"
        "i3"
        "i3blocks"
        "xinput"
        "pulseaudio"
        "brightnessctl"
        "flameshot"
        "blueman"
) 

for d in ${DEPENDENCIES[@]};
do
        if ! command -v $d 2>&1>/dev/null
        then
                sudo apt install $d
                printf "\n$d installed\n"
                echo "*************************"
        else
                printf "\n$d already installed:\n"
                $d --version
                echo "-------------------------"
        fi
done

~/.local/scripts/install-kitty.sh
~/.local/scripts/install-font.sh
~/.local/scripts/install-nvim.sh
~/.local/scripts/install-rust.sh

printf "\nSuccess!\n"
