#!/bin/bash

xrandr --auto

PRIMARY=$(xrandr --query | awk '/ connected / && /DP/ { if(!first)first=$1; if($3=="primary"){print $1;found=1;exit} }; END{if(!found)print first}')
DISPLAYS=$(xrandr --query | grep " connected" | grep -v "$PRIMARY" | awk '{print $1}') 
MODE=$(xrandr | awk '/^DP-0/ {split($4,a,"+"); print a[1]}')
printf "POSITION=$POSITION, PRIMARY=$PRIMARY, MODE=$MODE, DISPLAYS=$DISPLAYS\n"

xrandr --output $PRIMARY --primary --preferred 
xrandr --output $PRIMARY --mode $MODE --rate 999

# Setup dual monitor if available
POSITION=${1:-right}
if [[ "${POSITION}" != "right" && "${POSITION}" != "left" ]]
then
    notify-send -i dialog-information "Display" "Wrong position: $POSITION"
    exit 1
fi

for d in ${DISPLAYS[@]};
do
    xrandr --output $PRIMARY --primary --rate 999 \
           --output $d --$POSITION-of $PRIMARY --rate 999
    notify-send -i dialog-information "Display" "$d display on the $POSITION"
    exit 0
done

