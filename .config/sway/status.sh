mute=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
[[ $mute == *"MUTED"* ]] && volume=0
brightness=$(brightnessctl | grep -E brightness | awk '{print substr($4, 2, length($4)-2)}')
power=$(cat /sys/class/power_supply/BAT0/capacity)
date=$(date +'%a %b %d %H:%M')

echo Vol: $volume% \| Bri: $brightness \| Pow: $power% \| $date
