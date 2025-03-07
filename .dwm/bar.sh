while true; do

    LOCALTIME=$(date +[%Y-%m-%d][%H:%M])
    VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
    MEM=$(free -h --kilo | awk '/^Mem:/ {print $3 "/" $2}')
    CPU=$(top -bn 1 | grep "Cpu(s)" | tr -d 'usy,' | awk '{print $3}' )
    TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))󰔄"
    DISK=$(df -Ph | grep "/dev/nvme0n1p3" | awk {'print $3'})
    DISKLEFT=$(df -Ph | grep "/dev/nvme0n1p3" | awk {'print $2'})
    BAT0="$(cat /sys/class/power_supply/BAT0/capacity)"
    BAT1="$(cat /sys/class/power_supply/BAT1/capacity)"
    
    
    xsetroot -name " [󰄩: $MEM][󰍛:$CPU% $TEMP][󰋊: $DISK/$DISKLEFT][: $VOL][$BAT0%|$BAT1%  ]$LOCALTIME"
    sleep 10s
done &
