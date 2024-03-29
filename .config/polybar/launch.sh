#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.1; done

screens=$(xrandr --current --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

if [[ $(xrandr --current --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
  MONITOR=$(polybar --list-monitors | cut -d":" -f1) polybar main &
else
  primary=$(xrandr --current --query | grep primary | cut -d" " -f1)

  for m in $screens; do
    if [[ $primary == $m ]]; then
        MONITOR=$m polybar main &
    else
        MONITOR=$m polybar secondary &
    fi
  done
fi
