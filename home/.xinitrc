#!/bin/sh
/usr/bin/xinput --set-prop 15 'libinput Accel Speed' 1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom &
setbg & 
remaps &
touchpad &
sxhkd &
autotiling &
dunst &
sh $HOME/.config/polybar/launch.sh &
nm-applet &
blueman-applet &
xfce4-power-manager &
exec i3
