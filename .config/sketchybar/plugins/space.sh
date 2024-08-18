#!/bin/sh

source "$CONFIG_DIR/colours.sh"

if [ "$SENDER" = "space_change" ]; then
  if [ $SELECTED = true ]; then
    COLOUR=$TEXT_COLOUR
  else
    COLOUR=$GREY
  fi
fi

sketchybar  --animate exp 10 \
            --set $NAME      \
                  background.drawing=on \
                  label.color=$GREY \
                  icon.color=$GREY

sketchybar  --animate exp 10 \
            --set space.$(aerospace list-workspaces --focused) \
                  background.drawing=on \
                  label.color=$TEXT_COLOUR \
                  icon.color=$TEXT_COLOUR
