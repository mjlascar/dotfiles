swayidle -w timeout 450 'swaylock -f -c 000000' \
            timeout 600 'hyprctl dispatch "hl.dsp.dpms({ action = \"off\" })"' \
            resume 'hyprctl dispatch "hl.dsp.dpms({ action = \"on\" })"' \
            timeout 750 'systemctl suspend' \
            before-sleep 'swaylock -f -c 000000' &
