#!/bin/bash

music=(
    script="$PLUGIN_DIR/music.sh"
    icon.color=$MAGENTA
    icon.padding_left=10
    label.padding_right=10
    background.color=$BACKGROUND_1
)

sketchybar -m --add event song_update com.apple.iTunes.playerInfo
sketchybar  --add item music right \
            --set music "${music[@]}" \
            click_script="$PLUGIN_DIR/music_click.sh" \
            --subscribe music song_update \
