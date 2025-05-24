power=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)
charging="+"
[[ $status == "Discharging" ]] && charging=""
date=$(date +'%a %b %d %H:%M')

echo Bat: $power%$charging \| $date
