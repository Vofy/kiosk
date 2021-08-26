#!/bin/sh
#
# Runs chrome and other tools necessary for kiosk

xset s noblank
xset s off
xset -dpms

while true; do
  killall -TERM chromium-browser 2>/dev/null;
  sleep 2;
  killall -9 chromium-browser 2>/dev/null;;

  sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
  sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences
  rm /home/pi/.config/chromium/SingletonLock

  unclutter -idle 0.5 -root &
  /usr/bin/chromium-browser --incognito --kiosk --noerrdialogs --disable --disable-default-apps --disable-single-click-autofill --disable-translate-new-ux --disable-translate --disable-infobars https://netbox.vofy.tech/ &
done
