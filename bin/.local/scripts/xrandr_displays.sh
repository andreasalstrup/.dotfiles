#!/bin/bash

POSITION=${1:-right}
if [[ "${POSITION}" != "right" && "${POSITION}" != "left" ]]
then
    notify-send -i dialog-information "Display" "Wrong position: $POSITION"
    exit 1
fi

PRIMARY=$(xrandr --query | grep primary | awk '{print $1}')
DISPLAYS=$(xrandr --query | grep " connected" | grep -v "$PRIMARY" | awk '{print $1}') 

xrandr --auto

for d in ${DISPLAYS[@]};
do
    xrandr --output $PRIMARY --primary \
           --output $d --$POSITION-of $PRIMARY
    notify-send -i dialog-information "Display" "$d display on the $POSITION"
    exit 0
done

