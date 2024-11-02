#!/bin/sh
case "$(printf 'reboot\npoweroff\nsuspend\nexit\nlock' | bemenu -l '5 down')" in
    "reboot") systemctl reboot ;;
    "poweroff") systemctl poweroff ;;
    "suspend") systemctl suspend ;;
    "exit") swaymsg exit ;;
    "lock") swaylock -f -c 000000 ;;
    *) exit 1 ;;
esac
