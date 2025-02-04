#!/bin/bash

is_installed=$(ls /usr/share/fonts/Hack)

if [[ -n "$is_installed" ]]; then
        exit 0
fi

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip
sudo unzip Hack.zip -d /usr/share/fonts/Hack
rm Hack.zip
fc-cache -f -v
