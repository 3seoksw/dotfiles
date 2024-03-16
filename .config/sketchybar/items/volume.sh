#!/bin/bash

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$THIRD_COLOUR
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color=$GREY
  slider.knob=􀀁
  slider.knob.drawing=off
)

volume_icon=(
  click_script="$PLUGIN_DIR/volume_click.sh"
  padding_left=10
  padding_right=0
  #icon.width=0
  #icon.align=left
  icon.color=$THIRD_COLOUR
  #label.width=25
  #label.align=left
)

status_bracket=(
  background.color=$ITEM_BG_COLOUR1
  background.border_color=$BORDER_COLOUR
  background.border_width=2
)

sketchybar --add slider volume right            \
           --set volume "${volume_slider[@]}"   \
           --subscribe volume volume_change     \
                              mouse.clicked     \
                              mouse.entered     \
                              mouse.exited      \
                                                \
           --add item volume_icon right         \
           --set volume_icon "${volume_icon[@]}"

sketchybar --add bracket status volume volume_icon \
           --set status "${status_bracket[@]}"
