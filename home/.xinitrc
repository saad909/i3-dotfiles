#!/bin/sh
/usr/bin/xinput --set-prop 15 'libinput Accel Speed' 1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom &
setbg & 
remaps &
touchpad &
sxhkd &
sh $HOME/.config/polybar/launch.sh &
nm-applet &
xfce4-power-manager &
blueman-applet &
autotiling &
dunst &
exec i3
