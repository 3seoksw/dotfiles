#!/bin/bash

volume=(
    script="$PLUGIN_DIR/volume.sh"
    icon.color=$BLUE
    icon.padding_left=10
    label.padding_right=10
)

sketchybar  --add item volume right \
            --set volume "${volume[@]}" \
            --subscribe volume volume_change \
