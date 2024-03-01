#!/bin/bash

WIDTH=100

volume_change() {
  case $INFO in
    [6-9][0-9]|100) ICON=􀊩
    ;;
    [3-5][0-9]) ICON=􀊧
    ;;
    [1-2][0-9]) ICON=􀊥
    ;;
    [1-9]) ICON=􀊡
    ;;
    0) ICON=􀊣
    ;;
    *) ICON=􀊩
  esac

  sketchybar --set volume_icon icon="$ICON" label="$INFO"

  sketchybar --set $NAME slider.percentage=$INFO \
             --animate tanh 30 --set $NAME slider.width=$WIDTH 

  sleep 2

  # Check wether the volume was changed another time while sleeping
  FINAL_PERCENTAGE=$(sketchybar --query $NAME | jq -r ".slider.percentage")
  if [ "$FINAL_PERCENTAGE" -eq "$INFO" ]; then
    sketchybar --animate tanh 30 --set $NAME slider.width=0
  fi
}

mouse_clicked() {
  osascript -e "set volume output volume $PERCENTAGE"
}

mouse_entered() {
  sketchybar --set $NAME slider.knob.drawing=on
}

mouse_exited() {
  sketchybar --set $NAME slider.knob.drawing=off
}

case "$SENDER" in
  "volume_change") volume_change
  ;;
  "mouse.clicked") mouse_clicked
  ;;
  "mouse.entered") mouse_entered
  ;;
  "mouse.exited") mouse_exited
  ;;
esac
