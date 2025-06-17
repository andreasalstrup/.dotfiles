#!/bin/bash

MAX=$(brightnessctl m)

if [[ "$MAX" -eq 1 ]]; then
        exit 0
fi

CURRENT=$(brightnessctl g | awk -v max=$max '{printf "SCR %.0f%%\n", ($1 / MAX) * 100}')
echo $CURRENT
