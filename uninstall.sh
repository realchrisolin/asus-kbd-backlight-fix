#!/bin/bash

sudo rm -f /etc/acpi/events/asus-kb-brightness-*
sudo rm -f /etc/acpi/asus-kb-brightness*
sudo rm -f /usr/lib/systemd/system-sleep/asus-keyboard-backlight.sh
sudo systemctl restart acpid
