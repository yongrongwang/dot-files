mute=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
[[ $mute == *"MUTED"* ]] && volume=0
dunstify -t 1000 -a 'volume' -u low -h string:x-dunst-stack-tag:"volume" -h int:value:"$volume" "Volume: ${volume}%"
