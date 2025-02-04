#!/bin/bash

max=$(brightnessctl m)

if [[ "$max" -eq 1 ]]; then
        exit 0
fi

current=$(brightnessctl g | awk -v max=$max '{printf "SCR %.0f%%\n", ($1 / max) * 100}')
echo $current
