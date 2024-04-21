#!/bin/sh

source "$CONFIG_DIR/colours.sh"

if [ $SELECTED = true ]; then
  sketchybar --animate exp 10 --set $NAME background.drawing=on \
                         label.color=$TEXT_COLOUR \
                         icon.color=$TEXT_COLOUR 
else
  sketchybar --animate exp 10 --set $NAME background.drawing=on \
                         label.color=$GREY \
                         icon.color=$GREY
fi
