#!/bin/bash

# Kill existing polybar instances
killall -q polybar

# Wait until they’re actually dead
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar top &
polybar bottom &
