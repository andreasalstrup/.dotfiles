#!/bin/bash

git clone https://github.com/neovim/neovim.git
cd neovim
sudo make install
cd -
sudo rm -rf neovim
