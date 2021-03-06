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
	sudo pacman -S bluez  blueman --noconfirm --needed
	sudo paru -S bluez-utils-compat --noconfirm --needed 
	sudo cp /etc/bluetooth/main.conf{,.bak}
	echo "AutoEnable=true" | sudo tee -a /etc/bluetooth/main.conf
	sudo systemctl enable bluetooth.service
	sudo systemctl start bluetooth.service
}
install_vmware(){
	# install vmware
	paru -S  vmware-workstation --noconfirm --needed
}
install_securecrt(){
	# install securecrt
	paru -S icu63 --noconfirm --needed
	cd /tmp
	git clone https://github.com/saad909/securecrt-1 scrt
	cd scrt; chmod +x ./installation.txt;./installation.txt && cd rm ../scrt -rf && cd $HOME/.dotfiles
}
install_gns3(){
	paru -S gns3-gui gns3-server  ubridge --noconfirm --needed
	sudo systemctl enable libvirtd;sudo systemctl start libvirtd
  sudo systemctl enable docker.service
  sudo systemctl start docker.service
  sudo gpasswd -a "$USER" docker
  sudo gpasswd -a "$USER" libvirt

}
setup_keepass(){
	sudo mkdir -p /usr/share/keepass/plugins;sudo mv $HOME/.dotfiles/keepass_plugins/*.plgx /usr/share/keepass/plugins
}
setup_for_networking(){
	# setup for networking
	printf "Want to setup for networking(y/n)"
	read selection
	if [[ $selection == 'y' || $selection == 'Y' ]]
	then
		# install_vmware
		install_securecrt
		install_gns3
		setup_keepass
		echo "Done..... Logout and login again ........"
		exit
	else
		echo "Done..... Logout and login again ........"
		exit
	fi
}
change_shell(){
	chsh -s /bin/zsh $USER
}
android_automount_setup(){
	paru -S mtpfs jmtpfs gvfs-mtp gvfs-gphoto2  --noconfirm
}
stop(){
	echo "Press enter to continue"
#	read test
}
externalHDD(){
echo" 
UUID=43EE29300D321D27   /home/ExternalHDD       ntfs-3g         defaults,rw     0 0 
" | sudo tee -a /etc/fstab
}
install_fonts(){
	mkdir $HOME/.local/share/fonts; cd $HOME/.local/share/fonts;
	curl -LO https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf
	curl -LO https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/FantasqueSansMono/Regular/complete/Fantasque%20Sans%20Mono%20Regular%20Nerd%20Font%20Complete%20Windows%20Compatible.ttf
	echo "source /etc/locale.conf" | sudo tee -a /etc/profile.d/locale.sh
}
# functions
printf "\n\n\t\t------------------------ Step(1/9) install packages ------------------------\n\n"
install_packages
stop
printf "\n\n\t\t------------------------ Step(2/9) - Installing paru ------------------------\n\n"
install_paru
stop
printf "\n\n\t\t------------------------ Step(3/9) installing aur packages ------------------------\n\n"
install_aur_packages
stop
printf "\n\n\t\t------------------------ Step(4/9) installing dotfiles ------------------------\n\n"
install_dotfiles
stop
printf "\n\n\t\t------------------------ Step(5/9) setting up wallpaper ------------------------\n\n"
set_wallpaper
stop
printf "\n\n\t\t------------------------ Step(6/9) setting up bluetooth ------------------------\n\n"
setting_up_bluetooth
stop
printf "\n\n\t\t------------------------ Step(7/9)  changing shell to zsh ------------------------\n\n"
change_shell
stop
printf "\n\n\t\t------------------------ Step(8/9)  android setup ------------------------\n\n"
android_automount_setup
stop
printf "\n\n\t\t------------------------ Step(9/9)  android setup ------------------------\n\n"
install_fonts()
stop
# for networking setup
printf "\n\n\t\t------------------------ Networking Section ------------------------\n\n"
setup_for_networking

# need to setup android
