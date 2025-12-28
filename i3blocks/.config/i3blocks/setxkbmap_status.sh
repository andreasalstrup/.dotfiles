#!/bin/bash

LAYOUT=$(setxkbmap -query | awk 'END {print $2 }')

echo "<span size='20000' rise='-7000'>⌨</span> <span>$LAYOUT</span>"
