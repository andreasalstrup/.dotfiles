#!/bin/bash

PRIMARY=$(xrandr --query | grep primary | awk '{print $1}')
DISPLAYS=$(xrandr --query | grep " connected" | grep -v "$PRIMARY" | awk '{print $1}') 
DISPLAYS=($DISPLAYS)
if [[ ${#DISPLAYS[@]} -ne 1 ]];
then
    xrandr --auto
    notify-send -i dialog-information "Display" "${#DISPLAYS[@]} connected"
    exit 0
fi

OUTPUT="display>"
case "$BLOCK_BUTTON" in
    1) POSITION=left; OUTPUT="<display" ;;
    3) POSITION=right; OUTPUT="display>" ;;
esac

~/.local/scripts/xrandr_displays.sh $POSITION

echo $OUTPUT

