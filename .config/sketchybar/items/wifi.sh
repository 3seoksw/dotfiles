#!/bin/bash

wifi=(
    icon="􀙇"
    icon.color=$SECOND_COLOUR
    icon.padding_left=10
    icon.padding_right=10
    label.padding_right=20
    background.color=$ITEM_BG_COLOUR1
    background.border_color=$BORDER_COLOUR
    background.border_width=2
    script="$PLUGIN_DIR/wifi.sh"
)

sketchybar  --add item wifi right \
            --set wifi "${wifi[@]}" \
            --subscribe wifi wifi_change mouse.clicked \
