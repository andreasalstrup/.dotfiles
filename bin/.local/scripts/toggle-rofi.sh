#!/bin/sh

if pgrep -x rofi; then
    killall rofi
else
    rofi rofi -show drun -show-icons -steal-focus &
fi
