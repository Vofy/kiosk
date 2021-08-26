#!/bin/bash
# Remove unnecessary packages
sudo apt purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 smartsim java-common minecraft-pi libreoffice* geany python3-thonny dillo vlc -y

sudo apt clean
sudo apt autoremove -y

sudo apt update
# sudo apt upgrade -y

sudo apt-get install xdotool unclutter sed chromium-browser lightdm openbox xorg rpd-plym-splash -y

# Copy config files
sudo cp -f .xsessionrc ~/
sudo cp -r themes/spos /usr/share/plymouth/themes/

# Apply theme
sudo plymouth-set-default-theme spos -R

# Disable rainbow image at boot
sudo sed -i "$ a\\\n# Disable rainbow image at boot\ndisable_splash=1" /boot/config.txt

# Run startx script
sudo sed -i "`wc -l < /etc/rc.local` i\\\n# Run startx script\nstartx\n" /etc/rc.local

# Enable plymouth splashscreen using raspi-config script
sudo raspi-config nonint do_boot_splash 0

# Enable autologin using raspi-config script
sudo raspi-config nonint do_boot_behaviour B4

# Reboot system
sudo reboot
