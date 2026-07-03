#!/bin/bash
# Symlink the rice configs into place. Existing non-symlink targets are
# backed up to *.bak before being replaced.
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        mv "$dst" "$dst.bak"
        echo "backed up $dst -> $dst.bak"
    fi
    ln -sfn "$src" "$dst"
    echo "linked $dst -> $src"
}

link "$DIR/aerospace/aerospace.toml" "$HOME/.aerospace.toml"
link "$DIR/sketchybar"               "$HOME/.config/sketchybar"
link "$DIR/borders"                  "$HOME/.config/borders"
link "$DIR/ghostty"                  "$HOME/.config/ghostty"

# Rectangle settings live in macOS defaults, not files
defaults import com.knollsoft.Rectangle "$DIR/rectangle/Rectangle.plist"
killall Rectangle 2>/dev/null || true
open -a Rectangle

echo "done — reload: sketchybar --reload; aerospace: alt-shift-c"
