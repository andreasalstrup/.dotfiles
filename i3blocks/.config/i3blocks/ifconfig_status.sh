#!/bin/bash

ISO=$(curl -s ifconfig.co/country-iso)

if [[ ${ISO} ]];
then
    echo "<b>🌐︎</b> $ISO"
else
    echo "<span><b>🌐︎ ¬</b></span>"
fi
