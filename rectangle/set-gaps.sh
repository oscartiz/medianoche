#!/bin/bash
# Rectangle screen-edge gaps for the 33pt sketchybar.
#
# Notched MacBook displays already reserve a 33pt top strip where sketchybar
# draws, so the gap there is 1 — NOT 0, because Rectangle treats a notch gap
# of 0 as unset and falls back to screenEdgeGapTop (double gap under the bar).
defaults write com.knollsoft.Rectangle screenEdgeGapTop -int 33
defaults write com.knollsoft.Rectangle screenEdgeGapTopNotch -int 1
defaults write com.knollsoft.Rectangle screenEdgeGapsOnMainScreenOnly -int 0

killall Rectangle 2>/dev/null || true
open -a Rectangle
