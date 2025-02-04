#!/bin/bash

RED="<span color='#eba0ac'>"
GREEN="<span color='#a6e3a1'>"
RESET="</span>"

capacity=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
status=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)

if  [[ -z "$capacity" ]]; then
        exit 0
fi

if [[ "$capacity" -le 15 ]]; then
    echo -e "${RED}${capacity}%${RESET}"
elif [[ "$status" == "Charging" ]]; then 
    echo -e "${GREEN}${capacity}%${RESET}"
else
    echo -e "${capacity}%"
fi

