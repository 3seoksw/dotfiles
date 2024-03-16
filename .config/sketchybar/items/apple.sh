#!bin/bash

POPUP_OFF='sketchybar --set apple.logo popup.drawing=off'
POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'

FONT_FACE="JetBrainsMono Nerd Font"
FONT="SF Pro"

APPLE="􀣺"
PENGUIN=""

apple_logo=(
    icon=$APPLE
    icon.color=$ACCENT_COLOUR
    padding_left=15
    padding_right=15
    background.color=$ITEM_BG_COLOUR2
    background.border_color=$GREY
    background.border_width=1
    label.drawing=off
    click_script="$POPUP_CLICK_SCRIPT"
    popup.height=35
    popup.background.color=$ITEM_BG_COLOUR1
    popup.background.border_color=$IVORY
    popup.background.border_width=1
    popup.background.corner_radius=10
    script="$PLUGIN_DIR/apple.sh"
)

apple_prefs=(
    icon=􀺽
    icon.color=$WHITE
    label="Preferences"
    label.color=$WHITE
    click_script="open -a 'System Preferences'; $POPUP_OFF"
    icon.padding_right=5
    background.padding_left=5
    background.padding_right=10
)

apple_activity=(
    icon=􀒓
    icon.color=$WHITE
    label="Activity"
    label.color=$WHITE
    click_script="open -a 'Activity Monitor'; $POPUP_OFF"
    icon.padding_right=5
    background.padding_left=5
    background.padding_right=10
)

apple_lock=(
    icon=􀒳
    icon.color=$WHITE
    label="Lock Screen"
    label.color=$WHITE
    click_script="pmset displaysleepnow; $POPUP_OFF"
    icon.padding_right=5
    background.padding_left=5
    background.padding_right=10
)

sketchybar --add item apple.logo left                    \
           --set apple.logo "${apple_logo[@]}"           \
                                                         \
           --add item apple.prefs popup.apple.logo       \
           --set apple.prefs "${apple_prefs[@]}"         \
                                                         \
           --add item apple.activity popup.apple.logo    \
           --set apple.activity "${apple_activity[@]}"   \
                                                         \
           --add item apple.lock popup.apple.logo        \
           --set apple.lock "${apple_lock[@]}"           \
                                                         \
           --subscribe $NAME mouse.entered mouse.clicked \
