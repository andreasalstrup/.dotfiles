#!/bin/bash

is_installed=$(which rustup)

if [[ -n "$is_installed" ]]; then
        exit 0
fi

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
