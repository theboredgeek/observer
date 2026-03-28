#!/bin/bash

# Check how many monitors are connected
MONITOR_COUNT=$(hyprctl monitors -j | jq '. | length')

if [ "$1" = "open" ]; then
    # When lid opens: Always enable the internal screen
    hyprctl keyword monitor "eDP-1, preferred, auto, 1"
elif [ "$1" = "close" ]; then
    if [ "$MONITOR_COUNT" -gt 1 ]; then
        # External monitor detected: Just disable internal screen (Clamshell)
        hyprctl keyword monitor "eDP-1, disable"
    else
        # No external monitor: Lock and Suspend (In-bag protection)
        loginctl lock-session
        systemctl suspend
    fi
fi