# install paru
install_paru(){
	cd /tmp
	sudo pacman -S git
	git clone https://aur.archlinux.org/paru.git
	cd paru; makepkg -si
}
install_packages(){
	# install pacman programs
	paru -S - < packages.txt --noconfirm --needed
}
install_aur_packages(){
	# install aur programs
	paru -S - < aur_packages --noconfirm --needed
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
# functions
printf "\n\n\t\t------------------------ Step(1/8) - Installing paru ------------------------\n\n"
install_paru
printf "\n\n\t\t------------------------ Step(2/8) install packages ------------------------\n\n"
install_packages
printf "\n\n\t\t------------------------ Step(3/8) installing aur packages ------------------------\n\n"
install_aur_packages
printf "\n\n\t\t------------------------ Step(4/8) installing dotfiles ------------------------\n\n"
install_dotfiles
printf "\n\n\t\t------------------------ Step(5/8) setting up wallpaper ------------------------\n\n"
set_wallpaper
printf "\n\n\t\t------------------------ Step(6/8) setting up bluetooth ------------------------\n\n"
setting_up_bluetooth
printf "\n\n\t\t------------------------ Step(7/8)  changing shell to zsh ------------------------\n\n"
change_shell
printf "\n\n\t\t------------------------ Step(8/8)  android setup ------------------------\n\n"
android_automount_setup
# for networking setup
printf "\n\n\t\t------------------------ Networking Section ------------------------\n\n"
setup_for_networking

# need to setup android
