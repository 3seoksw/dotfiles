#!/bin/bash

wifi=(
    script="$PLUGIN_DIR/wifi.sh"
    icon=$WIFI_OK
    icon.color=$YELLOW
    icon.padding_left=10
    label.padding_right=10
    background.color=$BACKGROUND_1
    background.padding_right=20
)

sketchybar  --add item wifi right \
            --set wifi "${wifi[@]}" \
            --subscribe wifi wifi_change \

