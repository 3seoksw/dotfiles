#!bin/bash

POPUP_OFF='sketchybar --set apple.logo popup.drawing=off'
POPUP_CLICK_SCRIPT='sketchybar --set $NAME popup.drawing=toggle'

FONT_FACE="JetBrainsMono Nerd Font"
FONT="SF Pro"

apple_logo=(
    icon=􀣺
    icon.font="$FONT:Black:16.0"
    icon.color=$ACCENT_COLOUR
    padding_left=15
    padding_right=15
    background.color="$BAR_COLOUR"
    label.drawing=off
    click_script="$POPUP_CLICK_SCRIPT"
    popup.height=35
    popup.background.color=$WHITE
    popup.background.corner_radius=10
)

apple_prefs=(
    icon=$PREFERENCES
    icon.color=$DARKGREY
    label="Preferences"
    label.color=$DARKGREY
    click_script="open -a 'System Preferences'; $POPUP_OFF"
    icon.padding_right=5
    background.padding_left=5
    background.padding_right=10
    background.color=$IVORY
)

apple_activity=(
    icon=$ACTIVITY
    icon.color=$DARKGREY
    label="Activity"
    label.color=$DARKGREY
    click_script="open -a 'Activity Monitor'; $POPUP_OFF"
    icon.padding_right=5
    background.padding_left=5
    background.padding_right=10
    background.color=$IVORY
)

apple_lock=(
    icon=$LOCK
    icon.color=$DARKGREY
    label="Lock Screen"
    label.color=$DARKGREY
    click_script="pmset displaysleepnow; $POPUP_OFF"
    icon.padding_right=5
    background.padding_left=5
    background.padding_right=10
    background.color=$IVORY
)

sketchybar --add item apple.logo left                   \
           --set apple.logo "${apple_logo[@]}"          \
                                                        \
           --add item apple.prefs popup.apple.logo      \
           --set apple.prefs "${apple_prefs[@]}"        \
                                                        \
           --add item apple.activity popup.apple.logo   \
           --set apple.activity "${apple_activity[@]}"  \
                                                        \
           --add item apple.lock popup.apple.logo       \
           --set apple.lock "${apple_lock[@]}"          \
           --subscribe $NAME mouse.entered              \
