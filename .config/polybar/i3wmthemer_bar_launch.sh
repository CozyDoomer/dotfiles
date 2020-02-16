#!/bin/env sh

pkill polybar

sleep 0.2;

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ $m = "DVI-D-0" ]; then
      MONITOR=$m polybar --reload i3wmthemer_bar_main &
    else
      MONITOR=$m polybar --reload i3wmthemer_bar_secondary &
    fi
  done
fi