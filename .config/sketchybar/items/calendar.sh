#!/bin/bash

calendar=(
  background.color=$ITEM_BG_COLOUR2
  background.border_color=$GREY
  background.border_width=2
  icon=󰃰
  icon.color=$ACCENT_COLOUR
  icon.padding_left=10
  label.padding_right=10
  update_freq=10
  script="$PLUGIN_DIR/calendar.sh"
  #click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
