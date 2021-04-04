#!/bin/sh

picom &
setbg & 
remaps&
touchpad &
sxhkd &
$HOME/.config/polybar/launch.sh --forest &
exec i3
