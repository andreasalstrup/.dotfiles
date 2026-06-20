#!/bin/bash

sh <(curl -L https://nixos.org/nix/install) --daemon

~/.local/scripts/install-home-manager.sh

printf "\nSuccess!\n"
