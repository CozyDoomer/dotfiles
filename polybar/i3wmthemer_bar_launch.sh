#!/bin/env sh

pkill polybar

sleep 0.2;

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ $m = "DVI-D-0" ]; then
      export TRAY_POS=right
    else
      unset TRAY_POS
    fi
    MONITOR=$m polybar --reload i3wmthemer_bar &
  done
else
  polybar --reload i3wmthemer_bar &
fi