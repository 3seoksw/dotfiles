#!/bin/bash

calendar=(
  icon=󰃰
  icon.color=$ACCENT_COLOUR
  icon.padding_left=10
  label.padding_right=10
  padding_left=15
  update_freq=10
  script="$PLUGIN_DIR/calendar.sh"
  #click_script="$PLUGIN_DIR/zen.sh"
  label.font="$FONT:White:14.0"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
