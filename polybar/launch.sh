#!/bin/env bash

# Terminate already running bars
killall -q polybar

# Wait until bars have been terminated
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


# Launch Polybar

# polybar mike &

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mike &
    done
else
    polybar --reload mike &
fi
