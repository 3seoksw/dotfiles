#!/bin/bash

STATE="$(echo "$INFO" | jq -r '.state')"
COLS=$(tput cols)
screen_size=$(wmctrl -d | grep '*' | awk '{print $4}')
echo "Width: $screen_size"
if [ "$STATE" = "playing" ]; then
  MEDIA="$(echo "$INFO" | jq -r '.title + " - " + .artist')"
  sketchybar --set $NAME label="$MEDIA" drawing=on
else
  sketchybar --set $NAME drawing=off
fi
