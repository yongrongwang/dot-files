#!/bin/sh
mute=$(pactl get-sink-mute @DEFAULT_SINK@)
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')
[[ $mute == *"yes" ]] && volume=0
dunstify -t 1000 -a "volume" -u low -h string:x-dunst-stack-tag:"volume" -h int:value:"$volume" "Volume: ${volume}"
