#!/bin/bash

sketchybar --add item media e \
           --set media label.color=$ACCENT_COLOUR     \
                       label.font="$FONT:Bold:14.0"   \
                       label.max_chars=20             \
                       icon.padding_left=0            \
                       scroll_texts=on                \
                       icon=􀑪                         \
                       icon.color=$ACCENT_COLOUR      \
                       background.drawing=off         \
                       script="$PLUGIN_DIR/media.sh"  \
           --subscribe media media_change
