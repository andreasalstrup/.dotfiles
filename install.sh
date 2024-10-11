#!/bin/bash

if ! command -v stow 2>&1>/dev/null
then
    echo "stow not installed"
    exit 1
fi

if ! command -v sed 2>&1>/dev/null
then
    echo "sed not installed"
    exit 1
fi

FOLDERS=$(ls -d */ | sed "s/\// /g")

for f in ${FOLDERS[@]};
do
    stow -D $f
    stow $f
done

echo "Success!"

