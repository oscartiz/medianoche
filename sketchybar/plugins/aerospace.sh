#!/usr/bin/env bash
# Renders one AeroSpace workspace pill ($1 = workspace id, $NAME = space.<id>).
# - focused workspace  -> filled accent pill
# - occupied workspace -> subtle pill with the glyphs of its apps
# - empty + unfocused  -> hidden, to keep the bar tidy

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icon_map.sh"

sid="${1:?workspace id required}"
FOCUSED="$(aerospace list-workspaces --focused 2>/dev/null)"

# Unique apps in this workspace -> space-separated glyph strip
apps="$(aerospace list-windows --workspace "$sid" --format '%{app-name}' 2>/dev/null | sort -u)"
strip=""
while IFS= read -r app; do
    [ -z "$app" ] && continue
    __icon_map "$app"
    strip="${strip}${icon_result} "
done <<< "$apps"
strip="${strip% }"

if [ "$sid" = "$FOCUSED" ]; then
    sketchybar --set "$NAME" drawing=on \
        background.drawing=on background.color="$ACCENT" \
        icon.color="$BG" label.color="$BG" \
        label="$strip"
elif [ -n "$strip" ]; then
    sketchybar --set "$NAME" drawing=on \
        background.drawing=on background.color="$BG_ALT" \
        icon.color="$FG" label.color="$FG_DIM" \
        label="$strip"
else
    sketchybar --set "$NAME" drawing=off
fi
