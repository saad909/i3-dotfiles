# install paru
install_paru(){
	cd /tmp
	git clone https://aur.archlinux.org/paru-bin.git
	cd paru-bin; makepkg -si
}
install_packages(){
	# install pacman programs
	cd ~/.dotfiles
	sudo pacman -S - < $HOME/.dotfiles/packages.txt --noconfirm --needed
}
install_aur_packages(){
	# install aur programs
	paru -S - < $HOME/.dotfiles/aur_packages --noconfirm --needed

}
install_dotfiles(){
	# move previous dotfiles
	mkdir $HOME/prev_dotfiles;mv $HOME/.* $HOME/prev_dotfiles
	mv  $HOME/prev_dotfiles/.dotfiles ~
	# install dot files
	cd $HOME/.dotfiles
	stow home
}
set_wallpaper(){
	# setup wallpaper
	$HOME/.config/scripts/setbg $HOME/.dotfiles/wallpaper.jpg
}
setting_up_bluetooth(){
	# bluetooth setup
	sudo cp /etc/bluetooth/main.conf{,.bak}
	echo "
	AutoEnable=true
	" | sudo tee -a /etc/bluetooth/main.conf
	sudo systemctl start bluetooth.service
	sudo systemctl enable bluetooth.service
}
install_vmware(){
	# install vmware
	paru -S  vmware-workstation --noconfirm --needed
}
install_securecrt(){
	# install securecrt
	paru -S icu63
	cd /tmp
	git clone https://github.com/saad909/securecrt-1 scrt
	cd scrt; chmod +x ./installation.txt;./installation.txt && cd rm ../scrt -rf && cd $HOME/.dotfiles
}
install_gns3(){
	paru -S gns3-gui gns3-server  ubridge --noconfirm --needed
}
setup_for_networking(){
	# setup for networking
	printf "Want to setup for networking(y/n)"
	read selection
	if [[ $selection == 'y' || $selection == 'Y' ]]
	then
		install_vmware
		install_securecrt
		install_gns3
		echo "Done ........"
		return
	else
		echo "Done ........"
		return
	fi
}
change_shell(){
	chsh -s /bin/zsh $USER
}
android_automount_setup(){
	paru -S mtpfs jmtpfs gvfs-mtp gvfs-gphoto2  --noconfirm
}
stop(){
	read test
}
# functions
printf "\n\n\t\t------------------------ Step(1/8) install packages ------------------------\n\n"
install_packages
stop
printf "\n\n\t\t------------------------ Step(2/8) - Installing paru ------------------------\n\n"
install_paru
stop
printf "\n\n\t\t------------------------ Step(3/8) installing aur packages ------------------------\n\n"
install_aur_packages
stop
printf "\n\n\t\t------------------------ Step(4/8) installing dotfiles ------------------------\n\n"
install_dotfiles
stop
printf "\n\n\t\t------------------------ Step(5/8) setting up wallpaper ------------------------\n\n"
set_wallpaper
stop
printf "\n\n\t\t------------------------ Step(6/8) setting up bluetooth ------------------------\n\n"
setting_up_bluetooth
stop
printf "\n\n\t\t------------------------ Step(7/8)  changing shell to zsh ------------------------\n\n"
change_shell
stop
printf "\n\n\t\t------------------------ Step(8/8)  android setup ------------------------\n\n"
android_automount_setup
stop
# for networking setup
printf "\n\n\t\t------------------------ Networking Section ------------------------\n\n"
setup_for_networking

# need to setup android
