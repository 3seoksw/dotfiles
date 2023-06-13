#!/usr/bin/env zsh

ICON_PADDING_RIGHT=5

case $INFO in
"Arc")
    ICON_PADDING_RIGHT=5
    ICON=󰞍
    ;;
"Code")
    ICON_PADDING_RIGHT=4
    ICON=󰨞
    ;;
"iTerm2")
    ICON_PADDING_RIGHT=5
    ICON=
    ;;
"Firefox")
    ICON_PADDING_RIGHT=6
    ICON=
    ;;
"Calendar")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"Notability")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Discord")
    ICON=󰙯
    ;;
"FaceTime")
    ICON_PADDING_RIGHT=5
    ICON=
    ;;
"Finder")
    ICON=
    ;;
"Google Chrome")
    ICON_PADDING_RIGHT=7
    ICON=
    ;;
"IINA")
    ICON_PADDING_RIGHT=4
    ICON=󰕼
    ;;
"kitty")
    ICON=󰄛
    ;;
"Messages")
    ICON=󰍦
    ;;
"Notion")
    ICON_PADDING_RIGHT=6
    ICON=󰈄
    ;;
"Preview")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"PS Remote Play")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"Music")
    ICON=󰎆
    ;;
"TextEdit")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Transmission")
    ICON_PADDING_RIGHT=3
    ICON=󰶘
    ;;
*)
    ICON=﯂
    ;;
esac

icon_res="$($HOME/.config/sketchybar/plugins/icon_map.sh "$INFO")"
#sketchybar --set front_app icon=$icon_res icon.drawing=on icon.padding_right=$ICON_PADDING_RIGHT label=$INFO
sketchybar --set front_app icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT label=$INFO
