#!/bin/bash

# Read keyboard settings
MODEL=$(grep ^XKBMODEL= /etc/default/keyboard | cut -d"=" -f2 | tr -d '"')
LAYOUT=$(grep ^XKBLAYOUT= /etc/default/keyboard | cut -d"=" -f2 | tr -d '"')
VARIANT=$(grep ^XKBVARIANT= /etc/default/keyboard | cut -d"=" -f2 | tr -d '"')
OPTIONS=$(grep ^XKBOPTIONS= /etc/default/keyboard | cut -d"=" -f2 | tr -d '"')

# Print them (optional)
echo "MODEL=$MODEL LAYOUT=$LAYOUT VARIANT=$VARIANT OPTIONS=$OPTIONS"

# Apply the keyboard layout
setxkbmap -model "$MODEL" -layout "$LAYOUT" -variant "$VARIANT" ${OPTIONS:+-option "$OPTIONS"}

