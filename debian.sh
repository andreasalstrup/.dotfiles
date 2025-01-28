#!/bin/bash

DEPENDENCIES=(
        "sed"
        "stow"
        "nvim"
        "tmux"
        "clang"
        "rofi"
        "i3"
        "kitty"
        "polybar"
        "flameshot"
) 

for d in ${DEPENDENCIES[@]};
do
        if ! command -v $d 2>&1>/dev/null
        then
                apt install $d
                printf "\n$d installed\n"
                echo "*************************"
        else
                printf "\n$d already installed:\n"
                $d --version
                echo "-------------------------"
        fi
done

printf "\nSuccess!\n"
