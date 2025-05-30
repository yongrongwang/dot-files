brightness=$(brightnessctl | grep -E brightness | awk '{print substr($4, 2, length($4)-2)}')
dunstify -t 1000 -a 'brightness' -u low -h string:x-dunst-stack-tag:"brightness" -h int:value:"$brightness" "Brightness: ${brightness}"
