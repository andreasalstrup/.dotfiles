#!/bin/bash

DEPENDENCIES=("nvim" "clang")  

for d in ${DEPENDENCIES[@]};
do
        if ! command -v $d 2>&1>/dev/null
        then
                apt install $d
                printf "\n$d installed\n"
        else
                printf "\n$d already installed:\n"
                $d --version
        fi
done

printf "\nSuccess!\n"
