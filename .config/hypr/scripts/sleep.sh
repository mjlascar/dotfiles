swayidle -w timeout 450 'swaylock -f -c 000000' \
            timeout 600 'hyprctl dispatch dpms off' \
            resume 'hyprctl dispatch dpms on' \
            timeout 750 'systemctl suspend' \
            before-sleep 'swaylock -f -c 000000' &
