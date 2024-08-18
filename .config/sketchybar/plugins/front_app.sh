#!/bin/sh

AEROSPACE_FOCUSED_MONITOR_NO=$(aerospace list-workspaces --focused)
AEROSPACE_LIST_OF_WINDOWS_IN_FOCUSED_MONITOR=$(aerospace list-windows --workspace $AEROSPACE_FOCUSED_MONITOR_NO | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --animate sin 10 --set "$NAME" label="$INFO" icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$INFO")"

  apps=$AEROSPACE_LIST_OF_WINDOWS_IN_FOCUSED_MONITOR
  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app
    do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<< "${apps}"
  else
    icon_strip=" —"
  fi
  sketchybar --animate sin 10 --set space.$AEROSPACE_FOCUSED_MONITOR_NO label="$icon_strip"
fi

# if [ "$SENDER" = "front_app_switched" ]; then
#   sketchybar --animate sin 10 --set $NAME label="$INFO" icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$INFO")"
# fi
