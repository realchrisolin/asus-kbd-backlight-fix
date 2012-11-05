#!/bin/bash

# mapping touches Fn+F3 et Fn+F4 => scripts
sudo cp events/* /etc/acpi/events/.
sudo chmod 644 /etc/acpi/events/asus-kb-brightness-*

# scripts for backlight change
sudo cp asus-kb-brightness* /etc/acpi/.
sudo chmod 755 /etc/acpi/asus-kb-brightness*

# systemd hook
sudo cp asus-keyboard-backlight.sh /usr/lib/systemd/system-sleep/.
sudo chmod 755 /user/lib/systemd/system-sleep/asus-keyboard-backlight.sh

sudo systemctl restart acpid
