#!/bin/bash

############################################
# File: asus-keyboard-backlight.sh
#
# Author: Chris Olin (http://chrisolin.com)
#
# Date: Sun 04 Nov 2012 10:32:58 PM EST
#
# Purpose: Dim Asus keyboard backlight
#          prior to hibernate/suspend
#          and restore backlight on resume
############################################

BRIGHTNESSFILE=/tmp/kbd-brightness

if [[ $1 == 'pre' ]] ; then
    STATUS="`cat /sys/devices/platform/asus_laptop/leds/asus::kbd_backlight/brightness`"
    STATUS=$(($STATUS-128))
    echo $STATUS > $BRIGHTNESSFILE
    for i in `seq 0 $STATUS`; do
	    /etc/acpi/asus-kb-brightness-down.sh
    done
elif [[ $1 == 'post' ]] ; then
    	if [ -f $BRIGHTNESSFILE ]; then
        	STATUS=`cat $BRIGHTNESSFILE`
   	 else
        	STATUS=2
	fi
	for i in `seq 0 $STATUS` ; do
		/etc/acpi/asus-kb-brightness-up.sh
	done
fi
