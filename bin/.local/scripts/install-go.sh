#!/bin/bash

LATEST=$(curl -s https://go.dev/VERSION?m=text | head -n 1)
wget https://go.dev/dl/${LATEST}.linux-amd64.tar.gz

rm -rf /usr/local/go && tar -C /usr/local -xzf ${LATEST}.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

echo "TODO: PATH=$PATH:/usr/local/go/bin"
go version
