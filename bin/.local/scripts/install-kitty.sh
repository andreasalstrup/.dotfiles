#!/bin/bash

is_installed=$(ls ~/.local/kitty.app/bin/kitty)

if [[ -n "$is_installed" ]]; then
        exit 0
fi

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
