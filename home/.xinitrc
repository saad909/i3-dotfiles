#!/bin/sh
# increase key speed
xset r rate 300 50
# replace capslock with escape
setxkbmap -option caps:escape &
# enable touchpad
touchpad &
# Load ~/.Xresources file
/usr/bin/xrdb -merge $HOME/.Xresources  &
/usr/bin/xset b off &
# enable polkit agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & 
# for qt applications to get the themes from gtk themes
exec i3 
