#!/bin/bash

is_installed=$(which nvim)

if [[ -n "$is_installed" ]]; then
        exit 0
fi

# Install Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo rm -rf /usr/local/share/nvim /usr/local/lib/nvim /usr/local/bin/nvim
sudo make install
cd -
sudo rm -rf neovim
