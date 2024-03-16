#!/bin/bash

sketchybar --add item front_app left \
           --set front_app       background.color=$ITEM_BG_COLOUR1            \
                                 background.border_color=$BORDER_COLOUR       \
                                 background.border_width=2                    \
                                 icon.color=$TEXT_COLOUR                      \
                                 icon.padding_left=10                         \
                                 icon.font="sketchybar-app-font:Regular:16.0" \
                                 label.color=$TEXT_COLOUR                     \
                                 label.padding_right=10                       \
                                 script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched
