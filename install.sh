#!/bin/bash
# Remove unnecessary packages
sudo apt purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 smartsim java-common minecraft-pi libreoffice* geany python3-thonny dillo vlc -y

sudo apt clean
sudo apt autoremove -y

sudo apt update
# sudo apt upgrade -y

sudo apt-get install xdotool unclutter sed chromium-browser openbox xserver-xorg-core xinit rpd-plym-splash -y

# Copy config files
mkdir -p ~/.config/openbox/autostart && cp -f kiosk.sh ~/.config/openbox/autostart
cp -f .bash_profile ~/
sudo cp -r grub-theme/spos /usr/share/plymouth/themes/

# Apply theme
sudo plymouth-set-default-theme spos -R

# Disable rainbow image at boot
sudo sed -i "$ a\\\n# Disable rainbow image at boot\ndisable_splash=1" /boot/config.txt

# Enable plymouth splashscreen using raspi-config script
sudo raspi-config nonint do_boot_splash 0

# Enable autologin using raspi-config script
sudo raspi-config nonint do_boot_behaviour B2

# Reboot system
sudo reboot
