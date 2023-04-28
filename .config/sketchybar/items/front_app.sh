#!/bin/bash

SCRIPT='sketchybar --set $NAME label="$INFO"'

yabai=(
  icon.width=0
  label.width=0
  script="$PLUGIN_DIR/yabai.sh"
  icon.font="$FONT:Bold:16.0"
  associated_display=active
)

sketchybar  --add event window_focus \
            --add event windows_on_spaces \
            --add item yabai left \
            --set yabai "${yabai[@]}" \
            --subscribe yabai   window_focus      \
                                windows_on_spaces \
                                mouse.clicked     \


front_app=(
    icon.font="JetBrainsMono Nerd Font:Medium:20.0"
    icon.padding_left=10
    label.font="$FONT:Black:12.0"
    label.padding_right=10
    associated_display=active
)

sketchybar  --add item front_app left           \
            --set front_app "${front_app[@]}"   \
            script="$ITEM_DIR/front_icons.sh" \
            --subscribe front_app front_app_switched
