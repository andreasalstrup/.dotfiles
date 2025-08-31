#!/bin/bash

DEPENDENCIES=(
        "sed"
        "git"
        "cmake"
        "curl"
        "ripgrep"
        "zsh"
        "tmux"
        "clang"
        "rofi"
        "i3"
        "i3blocks"
        "xclip"
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
                sudo apt install -y $d
                printf "\n$d installed\n"
                echo "*************************"
        else
                printf "\n$d already installed:\n"
                $d --version
                echo "-------------------------"
        fi
done

echo -e "\nsource ~/.zshrc_aliases" >> ~/.zshrc

~/.local/scripts/install-kitty.sh
~/.local/scripts/install-font.sh
~/.local/scripts/install-nvim.sh
~/.local/scripts/install-ohmyzsh.sh
~/.local/scripts/install-rust.sh
~/.local/scripts/install-go.sh
~/.local/scripts/install-nvm.sh

printf "\nSuccess!\n"
