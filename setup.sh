installation_for_networking(){
	# install vmware
	paru -S  vmware-workstation --noconfirm --neeeded
	# install securecrt
	cd /tmp
	git clone https://github.com/saad909/securecrt-1 scrt
	cd scrt; chmod +x ./installation.txt;./installation.txt
	# install gns3
	sudo pacman -S lib32-openssl lib32-gcc-libs ubridge --noconfirm --needed
	paru -S gns3-gui gns3-server  ubridge --noconfirm --needed
}

# install paru
echo "(1/9)installing paru"
cd /tmp
sudo pacman -S git
git clone https://aur.archlinux.org/paru.git
cd paru; makepkg -si

# install pacman programs
echo "(2/9)installing programs"
sudo pacman -S base-devel --needed;sudo pacman -S git glibc \  
       rofi ranger alacritty picom dmenu vim xclip sxhkd \
       pcmanfm python-pip npm ueberzug xwallpaper atool \
       xcape tmux zsh cmus qutebrowser firefox galculator \
       youtube-dl arandr xrandr putty zsh-autosuggestion \
       zsh-syntax-highlighting --noconfirm --neeeded
# install aur programs
echo "(3/9)installing aur programs"
paru -S neovim-nightly-git ly-git i3-gaps-rounded-git \
	autotiling arch-wiki-dmenu polybar aic94xx-firmware \
       	upd72020x-fw --noconfirm --neeeded

# install dot files
echo "(4/9)installing dotfiles"
cd $HOME/.dotfiles
stow home
# install gtk theme
echo "(5/9)installing gtk themes"
paru -S yaru-icon-them yaru-sound-theme yaru-gtk-theme\
	--noconfirm --neeeded
# setup wallpaper
echo "(6/9)setting wallpaper"
$HOME/.config/scripts/setbg wallpaper.jpg
pprint "Want to setup for networking?"
read selection
if [[ $seclection -eq 'y' || $selection -eq 'Y ]]
then
	installation_for_networking
	clear_directory
else
	exit 0
fi

