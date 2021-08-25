#!/bin/bash
echo -e "\n# Disable rainbow image at boot\ndisable_splash=1" >> /boot/config.txt
echo -e "startx --" >> ~/.bashrc
sudo apt purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 smartsim java-common minecraft-pi libreoffice* geany python3-thonny dillo vlc -y

sudo apt clean
sudo apt autoremove -y

sudo apt update
sudo apt upgrade -y

sudo apt-get install xdotool unclutter sed chromium-browser -y

sudo cp -f kiosk.sh ~/
sudo cp -r themes/spos /usr/share/plymouth/themes/

sudo plymouth-set-default-theme spos -R
