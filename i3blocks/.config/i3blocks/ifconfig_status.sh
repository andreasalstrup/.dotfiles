#!/usr/bin/env bash

ISO=$(curl -s ifconfig.co/country-iso)

if [[ ${ISO} ]];
then
    echo "$ISO"
else
    echo "¬"
fi
