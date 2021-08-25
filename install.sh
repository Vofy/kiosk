#!/bin/bash
sudo apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 smartsim java-common minecraft-pi libreoffice* plymouth -y

sudo apt-get clean
sudo apt-get autoremove -y

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install xdotool unclutter sed -y

sudo cp kiosk.sh ~/
sudo cp kiosk.service /lib/systemd/system/
sudo cp themes/spos /usr/share/plymouth/themes/

sudo plymouth-set-default-theme spos -R
sudo systemctl enable --now kiosk.service
