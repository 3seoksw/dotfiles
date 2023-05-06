#!/bin/bash

calendar=(
    icon=󰃰
    icon.color=$RED
    icon.padding_left=10
    label.color=$WHITE
    label.padding_right=10
    background.color=$BACKGROUND_1
    background.height=25 
    background.corner_radius=10
    background.padding_right=30 
    update_freq=10
    script="$PLUGIN_DIR/calendar.sh"
)

sketchybar  --add item calendar right \
            --set calendar "${calendar[@]}" \
