#!/bin/bash

LATEST=$(curl -s https://go.dev/VERSION?m=text | head -n 1)
wget https://go.dev/dl/${LATEST}.linux-amd64.tar.gz

sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf ${LATEST}.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

echo -e "\n# Go\nexport PATH=\$PATH:/usr/local/go/bin" >> ~/.zshrc
go version
