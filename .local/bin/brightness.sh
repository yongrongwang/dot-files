#!/bin/sh
current=$(cat /sys/class/backlight/intel_backlight/brightness)
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)
brightness=$((100 * current / max))
dunstify -t 1000 -a "brightness" -u low -h string:x-dunst-stack-tag:"brightness" -h int:value:"$brightness" "Brightness: ${brightness}"
