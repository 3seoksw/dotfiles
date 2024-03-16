#!/bin/bash

click() {
  CURRENT_HEIGHT="$(sketchybar --query apple.logo | jq -r .popup.height)"

  HEIGHT=0
  if [ "$CURRENT_HEIGHT" -eq "0"]; then
    WIDTH="dynamic"
  fi
  sketchybar --animate sin 20 --set $NAME popup.height="$HEIGHT"
}

case "$SENDER" in
  "mouse.clicked") click
esac
