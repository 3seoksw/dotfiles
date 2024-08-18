#!/bin/sh

sketchybar --add event aerospace_workspace_change

for m in $(aerospace list-monitors | awk '{print $1}'); do
  for i in $(aerospace list-workspaces --monitor $m); do
    sid=$i
    space=(
      space="$sid"
      icon="$sid"
      label.font="sketchybar-app-font:Regular:16.0"
      label.padding_right=20
      label.y_offset=-1
      script="$PLUGIN_DIR/space.sh"
    )
    sketchybar  --add space space.$sid left           \
                --set space.$sid "${space[@]}"        \
                --subscribe space front_app_switched  \
                # --subscribe space.$sid mouse.clicked  \

    apps=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
    icon_strip=" "
    if [ "${apps}" != "" ]; then
      while read -r app
      do
        icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
      done <<< "${apps}"
    else
      icon_strip=" —"
    fi

    sketchybar --animate sin 10 --set space.$sid label="$icon_strip"
  done
done

spaces_bracket=(
  background.color=$ITEM_BG_COLOUR1
  background.border_color=$BORDER_COLOUR
  background.border_width=2
)

sketchybar --add bracket spaces_bracket '/space\..*/'  \
           --set spaces_bracket "${spaces_bracket[@]}" \

sketchybar  --add item space_separator left                              \
            --subscribe space_separator aerospace_workspace_change       \
            --subscribe space_separator space_windows_change             \
            --set space_separator icon="􀆊"                               \
                                 icon.color=$TEXT_COLOUR                \
                                 icon.font="$FONT:Heavy:16.0"           \
                                 icon.padding_left=5                    \
                                 padding_left=10                        \
                                 padding_right=10                       \
                                 label.drawing=off                      \
                                 background.drawing=off                 \
                                 script="$PLUGIN_DIR/space_windows.sh"  \
