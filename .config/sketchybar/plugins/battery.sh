#!/bin/bash

source "$HOME/.config/sketchybar/colours.sh"

BATTERY_INFO="$(pmset -g batt)"
PERCENTAGE=$(echo "$BATTERY_INFO" | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(echo "$BATTERY_INFO" | grep 'AC Power')

DRAWING=on

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

COLOUR=$GREEN
case ${PERCENTAGE} in
  9[0-9]|100)
    ICON="􀛨"
    COLOUR=$GREEN
    ;;
  [6-8][0-9])
    ICON="􀺸"
    COLOUR=$GREEN
    ;;
  [3-5][0-9])
    ICON="􀺶"
    COLOUR=$YELLOW
    ;;
  [1-2][0-9])
    ICON="􀛩"
    COLOUR=$RED
    ;;
  *)
    ICON="􀛪"
    COLOUR=$RED
esac

if [[ $CHARGING != "" ]]; then
  ICON="􀢋"
fi

sketchybar --set $NAME \
    drawing=$DRAWING \
    icon="$ICON" \
    icon.color=$COLOUR \
    icon.padding_right=3 \
    label="${PERCENTAGE}%"
