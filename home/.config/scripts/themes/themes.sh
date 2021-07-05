#!/bin/bash
check_packages_existance()
{
    if pacman -Qs $package > /dev/null ; then
      echo 1
    else
      echo 0
    fi
}

apply_theme(){
    install_status=$(check_packages_existance i3-style)
    if [[ $install_status -eq "1" ]]
    then
        SCRIPTS_DIR="$HOME/.config/scripts/themes"
        THEMES_FILES_DIR="/usr/share/i3-style/themes"
        ALACRITY_CONFIG="$HOME/.config/alacritty/alacritty.yml"
        I3_XRESOURCES_COLORS_FILE="$HOME/.Xresources.d/i3theme.conf"
        I3_CONFIG="$HOME/.config/i3/config"
        files=$(ls $THEMES_FILES_DIR)
        # create list from the availabe themes
        themes_list=""
        # options="$theme_1\n$theme_2\n$theme_3\n$theme_4\n$theme_5\n$theme_6"
        for file in $files
        do
            themes_list+="$file\n"
        done
        chosen="$(echo -e "$themes_list" | rofi -p "Available themes" -dmenu -selected-row 0)"
        
        echo $chosen
        [ -z $chosen ] || echo $chosen > $SCRIPTS_DIR/current_theme \
            && i3-style $chosen -o $I3_CONFIG > /dev/null 2>&1 \
            && "$SCRIPTS_DIR/i3style2xresources.py" "$THEMES_FILES_DIR/$chosen" > $I3_XRESOURCES_COLORS_FILE > /dev/null 2>&1 \
            && "$SCRIPTS_DIR/alacritty_xresources_apply.py" $ALACRITY_CONFIG > /dev/null 2>&1 \
            && i3-msg reload && notify-send "$chosen theme applied"> /dev/null 2>&1 && return 0
            
            notify-send "Failed"
    else
        echo "Please install i3-style package using aur helper"
        notify-send "Please install i3-style package using aur helper"
    fi
}
apply_theme


