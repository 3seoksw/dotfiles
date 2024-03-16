SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar  --add space space.$sid left           \
              --subscribe space.$sid mouse.clicked  \
              --subscribe space front_app_switched  \
              --set space.$sid space=$sid           \
                               icon=$sid                                      \
                               label.font="sketchybar-app-font:Regular:16.0"  \
                               label.padding_right=20                         \
                               label.y_offset=-1                              \
                               script="$PLUGIN_DIR/space.sh"             
done

spaces_bracket=(
  background.color=$ITEM_BG_COLOUR1
  background.border_color=$BORDER_COLOUR
  background.border_width=2
)

sketchybar --add bracket spaces_bracket '/space\..*/'  \
           --set spaces_bracket "${spaces_bracket[@]}" \

sketchybar --add item space_separator left                              \
           --set space_separator icon="􀆊"                               \
                                 icon.color=$SECOND_COLOUR              \
                                 icon.font="$FONT:Heavy:16.0"           \
                                 icon.padding_left=5                    \
                                 padding_left=10                        \
                                 padding_right=10                       \
                                 label.drawing=off                      \
                                 background.drawing=off                 \
                                 script="$PLUGIN_DIR/space_windows.sh"  \
           --subscribe space_separator space_windows_change
