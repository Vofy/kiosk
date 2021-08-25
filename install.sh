#!/bin/bash
echo -e "# Disable rainbow image at boot\ndisable_splash=1" >> /boot/config.txt
echo -e "startx --" >> ~/.bashrc
sudo apt purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 smartsim java-common minecraft-pi libreoffice* lxde lxpanel lxdm lxde-common -y

sudo apt clean
sudo apt autoremove -y

sudo apt update
sudo apt upgrade -y

sudo apt-get install xdotool unclutter sed matchbox-window-manager -y

sudo cp kiosk.sh ~/
sudo cp kiosk.service /lib/systemd/system/
sudo cp -r themes/spos /usr/share/plymouth/themes/

sudo plymouth-set-default-theme spos -R
