#!/bin/bash

battery=(
    script="$PLUGIN_DIR/battery.sh"
    icon.color=$ACCENT_COLOUR
    icon.padding_left=10
    label.padding_right=10
    background.color=$ITEM_BG_COLOUR1
    background.border_color=$BORDER_COLOUR
    background.border_width=2
    background.padding_right=10 
    update_freq=120 
)

sketchybar --add item battery right \
    --set battery "${battery[@]}" \
    --subscribe battery system_woke power_source_change \
