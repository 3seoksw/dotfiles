#!/bin/bash

cpu=(
    label.font="FuraCode Nerd Font:Regular:10.0"
    label=CPU
    y_offset=6
    width=0
    padding_right=15
)

sketchybar  --add item disk_label right \
            --set disk_label "${cpu[@]}" \

cpu_percentage=(
    label.font="FuraCode Nerd Font:Regular:10.0"
    label=CPU
    y_offset=-4
    update_freq=1
    script="$PLUGIN_DIR/cpu.sh"
)

sketchybar  --add item disk_percentage right \
            --set disk_percentage "$cpu_percentage[@]" \
