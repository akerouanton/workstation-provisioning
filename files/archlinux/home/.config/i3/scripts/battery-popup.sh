#!/bin/sh

pkill -f i3-battery-popup

i3-battery-popup -L 15 -l 8 -t 1m -n -m " WARNING: Battery is getting low"
