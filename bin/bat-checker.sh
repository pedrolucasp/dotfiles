#!/usr/bin/env bash

cap=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [[ "$status" != "Charging" ]]; then
  if [[ "$cap" -lt 26 ]]; then
    notify-send -u 'critical' "Battery critically low!"
  fi
fi

