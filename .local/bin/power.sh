#!/bin/sh

case "$(printf "reboot\npoweroff\nsuspend" | bemenu)" in
    "reboot") systemctl reboot ;;
    "poweroff") systemctl poweroff ;;
    "suspend") systemctl suspend ;;
    *) exit 1 ;;
esac
