#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
/usr/bin/wal -i "$(< "${HOME}/.cache/wal/wal")"

# Launch bar1 and bar2
polybar -r VGA &
polybar -r HDMI &
