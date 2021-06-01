#!/bin/sh
remaps &
touchpad &
# xinput --set-prop 15 'libinput Accel Speed' 0.6 &
/usr/bin/xrdb -merge $HOME/.Xresources  &
/usr/bin/xset b off &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & 
export DESKTOP_SESSION=gnome &
export QT_STYLE_OVERIDE=GTK+ &
export QT_PLATFORMTHEME=qt5ct &
exec i3 
