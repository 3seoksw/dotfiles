#!/bin/sh

source "$CONFIG_DIR/colours.sh"

if [ $SELECTED = true ]; then
  sketchybar --set $NAME background.drawing=on \
                         background.color=$SECOND_COLOUR \
                         label.color=$BAR_COLOUR \
                         icon.color=$BAR_COLOUR
else
  sketchybar --set $NAME background.drawing=off \
                         label.color=$SECOND_COLOUR \
                         icon.color=$SECOND_COLOUR
fi
