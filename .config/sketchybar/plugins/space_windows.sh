#!/bin/bash

source "$CONFIG_DIR/colours.sh"

AEROSPACE_FOCUSED_MONITOR=$(aerospace list-monitors --focused | awk '{print $1}')
AEROSAPCE_WORKSPACE_FOCUSED_MONITOR=$(aerospace list-workspaces --monitor focused --empty no)
AEROSAPCE_WORKSPACE_MONITOR=$(aerospace list-workspaces --monitor focused)
AEROSPACE_EMPTY_WORKSPACE=$(aerospace list-workspaces --monitor focused --empty)

reload_workspace_icon() {
  apps=$(aerospace list-windows --workspace "$@" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app
    do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
    done <<< "${apps}"
  else
    icon_strip=" —"
  fi

  sketchybar --animate sin 10 --set space.$@ label="$icon_strip"
}

if [ "$SENDER" = "aerospace_workspace_change" ] || [ "$SENDER" = "space_windows_change" ]; then
  reload_workspace_icon "$AEROSPACE_PREV_WORKSPACE"
  reload_workspace_icon "$AEROSPACE_FOCUSED_WORKSPACE"

  sketchybar  --animate exp 10 \
              --set space.$AEROSPACE_FOCUSED_WORKSPACE \
                        background.drawing=on \
                        label.color=$TEXT_COLOUR \
                        icon.color=$TEXT_COLOUR

  sketchybar  --animate exp 10 \
              --set space.$AEROSPACE_PREV_WORKSPACE \
                        background.drawing=on \
                        label.color=$GREY \
                        icon.color=$GREY

  for i in $AEROSAPCE_WORKSPACE_MONITOR; do
    sketchybar --set space.$i display=$AEROSPACE_FOCUSED_MONITOR
  done

  # for i in $AEROSPACE_EMPTY_WORKSPACE; do
  #   sketchybar --set space.$i display=0
  # done

  sketchybar --set space.$AEROSPACE_FOCUSED_WORKSPACE display=$AEROSPACE_FOCUSED_MONITOR
fi
