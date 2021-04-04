my_setup(){
	# install vmware
	echo "(7/9)installing vmware"
	paru -S  vmware-workstation --noconfirm --needed
	# install securecrt
	echo "(8/9)installation securecrt"
	cd /tmp
	git clone https://github.com/saad909/securecrt-1 scrt
	cd scrt; chmod +x ./installation.txt;./installation.txt
	# install gns3
	echo "(9/9)installing gns3"
	sudo pacman -S lib32-openssl lib32-gcc-libs --noconfirm --needed
	paru -S gns3-gui gns3-server  ubridge --noconfirm --needed
	#install keepass and add its plugins
	#install nvidia drivers
	#setup for my fyp
}

# install paru
echo "(1/9)installing paru"
cd /tmp
sudo pacman -S git
git clone https://aur.archlinux.org/paru.git
cd paru; makepkg -si

# install pacman programs
echo "(2/9)installing programs"
sudo pacman -S base-devel --needed;\
	sudo pacman -S git glibc rofi ranger alacritty picom dmenu vim xclip sxhkd \
       thunar pcmanfm python-pip npm ueberzug xwallpaper atool \
       xcape tmux zsh cmus qutebrowser firefox galculator \
       youtube-dl arandr xrandr putty zsh-autosuggestions fzf \
       zsh-syntax-highlighting stow  libvirt gromit-mpx --noconfirm 
# install aur programs
echo "(3/9)installing aur programs"
paru -S neovim-nightly-bin ly-git i3-gaps-rounded-git \
	autotiling arch-wiki-dmenu polybar aic94xx-firmware \
	udiskie-dmenu-git networkmanager-dmenu btmenu \
       	upd72020x-fw  wd719x-firmware --noconfirm

# install dot files
echo "(4/9)installing dotfiles"
cd $HOME/.dotfiles
stow home
# install gtk theme
echo "(5/9)installing gtk themes"
paru -S yaru-icon-theme-git yaru-sound-theme-git yaru-gtk-theme-git\
	--noconfirm --needed

# setup wallpaper
echo "(6/9)setting wallpaper"
$HOME/.config/scripts/setbg $HOME/.dotfiles/wallpaper.jpg

# android setup
echo "(7/9)android setup"
puru --needed -S mtpfs jmtpfs gvfs-mtp gvfs-gphoto2  --noconfirm

# bluetooth setup
echo "(8/9)Bluetooth setup"
sudo pacman -S bluez bluez-utils-compat blueman --noconfirm
sudo cp /etc/bluetooth/main.conf{,.bak}
echo "
AutoEnable=yes
" | sudo tee - a/etc/bluetooth/main.conf
sudo pacman -S pulseaudio pulseaudio-bluetooth pavucontrol --noconfirm

# enabling services at startup
echo "(9/9)Enabling services"
sudo systemctl enable ly
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

################### Networking ###############################
printf "Want to setup for networking?"
read selection
if [[ $selection -eq 'y' || $selection -eq 'Y' ]]
then
	my_setup
elif [[ $selection -eq 'n' || $selection -eq 'N' ]]
then
	exit 0
fi

# enable service of ly
# android and bluetooth setup remaining
echo "Done........"

