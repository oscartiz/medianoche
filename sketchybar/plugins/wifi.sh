#!/bin/bash

# macOS 14+ redacts the SSID unless the calling process has Location Services
# permission. We always know whether we're connected from ifconfig; we only show
# the SSID when the OS lets us read it.

if ifconfig en0 2>/dev/null | grep -q "status: active" && \
   ifconfig en0 2>/dev/null | grep -q "inet "; then
    SSID=$(ipconfig getsummary en0 2>/dev/null | awk -F ' SSID : ' '/ SSID :/ {print $2; exit}')
    if [ -z "$SSID" ] || [ "$SSID" = "<redacted>" ]; then
        sketchybar --set "$NAME" icon="󰖩" label="Wi-Fi"
    else
        sketchybar --set "$NAME" icon="󰖩" label="$SSID"
    fi
else
    sketchybar --set "$NAME" icon="󰤭" label="off"
fi
