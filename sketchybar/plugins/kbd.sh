#!/bin/bash

LAYOUT=$(defaults read ~/Library/Preferences/com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID 2>/dev/null)

case "$LAYOUT" in
    *ABC*|*US*|*English*)         LABEL="EN" ;;
    *LatinAmerican*|*Spanish*|*ES*) LABEL="ES" ;;
    *British*)                    LABEL="GB" ;;
    *French*|*FR*)                LABEL="FR" ;;
    *German*|*DE*)                LABEL="DE" ;;
    *Italian*)                    LABEL="IT" ;;
    *Portuguese*)                 LABEL="PT" ;;
    *)                            LABEL="${LAYOUT##*.}" ;;
esac

sketchybar --set "$NAME" label="$LABEL"
