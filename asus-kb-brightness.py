#!/usr/bin/python

################################################################################
##
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License version 3, as published
## by the Free Software Foundation.
##
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranties of
## MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR
## PURPOSE.  See the GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License along
## with this program. If not, see <http://www.gnu.org/licenses/>.
##
################################################################################

import sys
import time
import pynotify

def pushNotification (icon, value):
	n = pynotify.Notification ("Brightness", "", icon)
	n.set_hint_int32 ("value", value);
	n.set_hint_string ("x-canonical-private-synchronous", "")
	n.show ()
	time.sleep (1)

if __name__ == '__main__':
	if not pynotify.init ("icon-value"):
		sys.exit (1)

	brightnessLevel = int(sys.argv[1])

	if brightnessLevel == -1:
		pushNotification ("notification-keyboard-brightness-off", -1)
	elif brightnessLevel == 0:
		pushNotification ("notification-keyboard-brightness-off", 0)
	elif brightnessLevel == 1:
		pushNotification ("notification-keyboard-brightness-low", 33)
	elif brightnessLevel == 2:
		pushNotification ("notification-keyboard-brightness-medium", 66)
	elif brightnessLevel == 3:
		pushNotification ("notification-keyboard-brightness-full", 100)
	elif brightnessLevel == 4:
		pushNotification ("notification-keyboard-brightness-full", 101)

