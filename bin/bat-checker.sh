#!/usr/bin/env bash
eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME i3)/environ)"
export DISPLAY=:0

cap=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [[ "$status" != "Charging" ]]; then
  if [[ "$cap" -lt 25 ]]; then
    notify-send -u 'critical' "Battery critically low!"
  fi
fi

