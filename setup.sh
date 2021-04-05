# install paru
install_paru(){
	cd /tmp
	sudo pacman -S git
	git clone https://aur.archlinux.org/paru.git
	cd paru; makepkg -si
}
install_packages(){
	# install pacman programs
	sudo pacman -S - < packages.txt --noconfirm --needed
}
install_aur_packages(){
	# install aur programs
	paru -S - < aur_packages.txt --noconfirm --needed
}
install_dotfiles(){
	# install dot files
	cd $HOME/.dotfiles
	stow home
}
set_wallpaper(){
	# setup wallpaper
	$HOME/.config/scripts/setbg $HOME/.dotfiles/wallpaper.jpg
}
install_bluetooth(){
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
		install_vmware()
		install_securecrt()
		echo "Done ........"
		return
	else
		echo "Done ........"
		return
	fi
}
# functions
printf "\n\n\t\t------------------------ Step(1/6) - Installing paru ------------------------\n\n"
install_paru
printf "\n\n\t\t------------------------ Step(2/6) install packages ------------------------\n\n"
install_packages
printf "\n\n\t\t------------------------ Step(3/6) installing aur packages ------------------------\n\n"
install_aur_packages
printf "\n\n\t\t------------------------ Step(4/6) installing dotfiles ------------------------\n\n"
install_dotfiles
printf "\n\n\t\t------------------------ Step(5/6) setting up wallpaper ------------------------\n\n"
set_wallpaper
printf "\n\n\t\t------------------------ Step(6/6) setting up bluetooth ------------------------\n\n"
settingup_bluetooth
# for networking setup
printf "\n\n\t\t------------------------ Networking Section ------------------------\n\n"
setup_for_networking
# enable service of ly
