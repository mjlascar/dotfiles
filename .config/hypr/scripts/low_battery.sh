#!/bin/sh

while true; do
    battery_path=$(upower -e | grep BAT)
    battery=$(upower -i "$battery_path" | grep -E "percentage" | awk '{print $2}' | tr -d '%')

    if [ "$battery" -le "20" ]; then
        charging=$(upower -i "$battery_path" | grep -i "state" | awk '{print $2}')
        if [ "$charging" != "charging" ]; then
            /sbin/hyprctl notify 0 5000 0 "  conectame gil : ${battery}%"
            volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -n 1)
            /sbin/playerctl pause
            /sbin/pactl set-sink-volume @DEFAULT_SINK@ 50%
            sleep 1
            /sbin/paplay /home/imgordo/Music/sonidos/wow-PVPFlagTakenHorde.ogg
            /sbin/pactl set-sink-volume @DEFAULT_SINK@ "$volume"
        fi
        sleep 240
    elif [ "$battery" -ge "90" ] ; then
        charging=$(upower -i "$battery_path" | grep -i "state" | awk '{print $2}')
        if [ "$charging" = "charging" ]; then
            /sbin/hyprctl notify 0 5000 0 "  aah desconectame: ${battery}%"
            volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -n 1)
            /sbin/playerctl pause
            /sbin/pactl set-sink-volume @DEFAULT_SINK@ 50%
            sleep 1
            /sbin/paplay /home/imgordo/Music/sonidos/wow-ReadyCheck.ogg
            /sbin/pactl set-sink-volume @DEFAULT_SINK@ "$volume" 
        fi
        sleep 300
    else
        sleep 120
    fi
done
