#!/bin/bash

battery=(
    script="$PLUGIN_DIR/battery.sh"
    icon.color=$GREEN
    icon.padding_left=10
    label.padding_right=10
    background.color=$BACKGROUND_1
    background.padding_right=10 
    background.corner_radius=10
    update_freq=120 
)

sketchybar --add item battery right \
    --set battery "${battery[@]}" \
    --subscribe battery system_woke power_source_change \
