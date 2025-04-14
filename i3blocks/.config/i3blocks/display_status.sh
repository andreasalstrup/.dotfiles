#!/bin/bash

PRIMARY=$(xrandr --query | awk '/ connected / && /DP/ { if(!first)first=$1; if($3=="primary"){print $1;found=1;exit} }; END{if(!found)print first}')
DISPLAYS=$(xrandr --query | grep " connected" | grep -v "$PRIMARY" | awk '{print $1}') 
DISPLAYS=($DISPLAYS)
if [[ ${#DISPLAYS[@]} -ne 1 ]];
then
    xrandr --auto
    notify-send -i dialog-information "Display" "${#DISPLAYS[@]} connected"
    exit 0
fi

# Read stored position
POSITION=$(cat /var/tmp/i3blocks/displays  2>/dev/null)
case "$POSITION" in
    left)  OUTPUT="<display" ;;
    right) OUTPUT="display>" ;;
    *)     OUTPUT="display>" ;;
esac

# Update
case "$BLOCK_BUTTON" in
    1) POSITION=left; OUTPUT="<display" ;;
    3) POSITION=right; OUTPUT="display>" ;;
esac

# Store current position
mkdir -p /var/tmp/i3blocks && echo $POSITION > /var/tmp/i3blocks/displays

~/.local/scripts/xrandr_displays.sh $POSITION

echo $OUTPUT

