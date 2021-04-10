#!/bin/sh

picom &
setbg & 
remaps&
touchpad &
sxhkd &
$HOME/.config/polybar/launch.sh &
exec i3
