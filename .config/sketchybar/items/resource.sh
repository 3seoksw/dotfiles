# CPU
sketchybar  --add item cpu_label right  \
            --set cpu_label label.font="JetBrains Mono:Bold:9.0" \
                  icon="󰍛" \
                  icon.color="$RED" \
                  icon.font.size=14.0 \
                  icon.y_offset=-5 \
                  label=CPU             \
                  y_offset=5            \
                  width=0               \
\
              --add item cpu_percent right  \
              --set cpu_percent label.font="JetBrains Mono:Regular:9.0"  \
                    y_offset=-4             \
                    update_freq=1           \
                    script="~/.config/sketchybar/plugins/cpu.sh"

# RAM
sketchybar  --add item ram_label right \
            --set ram_label label.font="JetBrains Mono:Bold:9.0" \
                  icon="󰝪" \
                  icon.color="$BLUE" \
                  icon.font.size=14.0 \
                  icon.y_offset=-5 \
                  label=RAM \
                  y_offset=5 \
                  width=0 \
\
            --add item ram_percentage right \
            --set ram_percentage label.font="JetBrains Mono:Regular:9.0" \
                                    y_offset=-4 \
                                    update_freq=1 \
                                    script="~/.config/sketchybar/plugins/ram.sh"

sketchybar --add bracket ram ram_labl ram_percentage \


resource_bracket=(
  background.color=$ITEM_BG_COLOUR1
  background.border_color=$BORDER_COLOUR
  background.border_width=2
)

sketchybar  --add bracket resource cpu_label ram_label \
            --set resource "${resource_bracket[@]}" \
