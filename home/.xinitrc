#!/bin/sh
remaps &
touchpad &
xinput --set-prop 15 'libinput Accel Speed' 0.6 &
export QT_STYLE_OVERIDE=GTK+ &
export QT_PLATFORMTHEME=qt5ct &
xrdb -merge $HOME/.Xresources  &
xset b off &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & 
exec i3 
