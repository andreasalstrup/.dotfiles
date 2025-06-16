#!/bin/bash

is_installed=$(which nvim)

if [[ -n "$is_installed" ]]; then
        exit 0
fi

git clone https://github.com/neovim/neovim.git
cd neovim
sudo make install
cd -
sudo rm -rf neovim
