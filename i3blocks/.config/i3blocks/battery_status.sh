#!/bin/bash

RED="<span color='#eba0ac'>"
GREEN="<span color='#a6e3a1'>"
RESET="</span>"

CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
STATUS=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)

if  [[ -z "$CAPACITY" ]]; then
        exit 0
fi

if [[ "$CAPACITY" -le 15 ]] && [[ "$STATUS" != "Charging" ]]; then
    echo -e "${RED}${CAPACITY}%${RESET}"
elif [[ "$STATUS" == "Charging" ]]; then 
    echo -e "${GREEN}${CAPACITY}%${RESET}"
else
    echo -e "${CAPACITY}%"
fi
