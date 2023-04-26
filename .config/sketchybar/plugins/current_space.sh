#!/usr/bin/env zsh

update_space() {
    SPACE_ID=$(echo "$INFO" | jq -r '."display-1"')

    case $SPACE_ID in
    1)
        ICON=󰅶
        ICON_PADDING_LEFT=10
        ICON_PADDING_RIGHT=10
        ;;
    *)
        ICON=$SPACE_ID
        ICON_PADDING_LEFT=10
        ICON_PADDING_RIGHT=13
        ;;
    esac

    sketchybar --set $NAME \
        icon=$ICON \
        background.padding_left=30 \
        icon.padding_left=$ICON_PADDING_LEFT \
        icon.padding_right=$ICON_PADDING_RIGHT
}

case "$SENDER" in
"mouse.clicked")
    # Reload sketchybar
    sketchybar --remove '/.*/'
    source $HOME/.config/sketchybar/sketchybarrc
    ;;
*)
    update_space
    ;;
esac
