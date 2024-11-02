#!/bin/sh
power=$(cat /sys/class/power_supply/BAT0/capacity)
date=$(date +"%a %b %d %H:%M")
echo Bat: $power%"   "$date
