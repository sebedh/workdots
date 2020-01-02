#!/bin/sh

time_date=$(date '+%Y %b %d (%a)  %H:%M v.%V')
battery=$(cat /sys/class/power_supply/BAT0/capacity)
mem=$(free -h | awk '/^Mem:/ {print $3 + 0 "/" $2 + 1"G"}')
ipaddr=$(hostname -I | awk '{print $1}')

echo "🖥️ $ipaddr 🔋 $battery ⚙️ $mem ⏰ $time_date"
