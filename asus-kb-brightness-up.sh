#!/bin/bash

STATUS="`cat /sys/devices/platform/asus_laptop/leds/asus::kbd_backlight/brightness`"
if (( $STATUS > 3 )); then
	STATUS=$(($STATUS-128))
fi

if (( $STATUS < 3 )); then
	((STATUS++))
	echo $STATUS > /sys/devices/platform/asus_laptop/leds/asus::kbd_backlight/brightness
fi

DISPLAY=:0 /etc/acpi/asus-kb-brightness.py $STATUS &

exit 0
