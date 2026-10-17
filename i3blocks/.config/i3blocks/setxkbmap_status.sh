#!/usr/bin/env bash

LAYOUT=$(setxkbmap -query | grep 'layout' | awk '{print $2 }')

echo "<span size='20000' rise='-7000'>⌨</span> <span>$LAYOUT</span>"
