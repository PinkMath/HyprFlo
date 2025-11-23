#!/bin/sh

echo "WARNING. THIS PROCESS WILL DELETE YOUR *.config*. PLEASE MAKE A BACKUP BEFORE DOING THIS"

username=$(whoami)
while true; do
	echo "username: $username?"
	read -p "(y / n) : " answer

	case "$answer" in
		[Yy]* )
			break
			;;
		[Nn]* )
			read -p "username: " username
			;;

		* )
			;;
	esac
	echo ""
done


if [ ! -d "/home/$username/" ]; then
	echo "/home/$username/ not exists"
	exit 1
fi

while true; do
	read -p "Wanna skip everythin?. IF YOU DO, YOU'LL ANSWER YES TO EVERYTHING (y/n)" answer

	case "$answer" in
		[Yy]* )
			sudo pacman -Sy
			sudo pacman -Syu
			sudo pacman -S xdg-desktop-portal xdg-desktop-portal-hyprland wireplumber base base-devel blueman bluez bluez-utils dunst fastfetch firefox flatpak git grim htop hyprland hyprshot kitty nano nemo neovim pavucontrol pipewire pipewire-alsa pipewire-pulse pipewire-jack rofi slurp starship sxiv unzip waybar
			systemctl --user start pipewire
			systemctl --user enable pipewire

			sudo rm -rf ~/.config
			sudo cp ./config /home/$username/
			sudo mv /home/$username/config /home/$username/.config
			sudo chown $username /home/$username/.config/*

			sudo rm -rf /home/$username/.bashrc
			sudo rm -rf /home/$username/.bash_profile

			sudo cp ./home/bashrc /home/$username/
			sudo cp ./home/bash_profile /home/$username/

			sudo mv ./home/bashrc /home/$username/.bashrc
			sudo mv ./home/bash_profile /home/$username/.bash_profile

			sudo chown $username /home/$username/.bashrc
			sudo chown $username /home/$username/.bash_profile

			git clone https://aur.archlinux.org/yay.git
			cd yay
			makepkg -si
			yay -S spotify swww wlogout

			sudo chmod +x /home/$username/.config/hypr/scripts/rofi-wallpaper.sh

			sudo cp -r ./home/pictures/ /home/$username/

			sure reboot
			;;
		[Nn]* )
			break
			;;
		* )
			;;
	esac
done


while true; do
	read -p "Wanna install the packages (y/n)? " answer

	case "$answer" in
		[Yy]* )
			sudo pacman -Sy
			sudo pacman -Syu
			sudo pacman -S xdg-desktop-portal xdg-desktop-portal-hyprland wireplumber base base-devel blueman bluez bluez-utils dunst fastfetch firefox flatpak git grim htop hyprland hyprshot kitty nano nemo neovim pavucontrol pipewire pipewire-alsa pipewire-pulse pipewire-jack rofi slurp starship sxiv unzip waybar
			systemctl --user start pipewire
			systemctl --user enable pipewire
			break
			;;
		[Nn]* )
			break
			;;
		* )
			;;
	esac
	echo ""
done


while true; do
	read -p "Wanna use the *.config* from the repo (y/n)? " answer

	case "$answer" in
		[Yy]* )
			sudo rm -rf ~/.config
			sudo cp ./config /home/$username/
			sudo mv /home/$username/config /home/$username/.config
			sudo chown $username /home/$username/.config/*
			break
			;;
		[Nn]* )
			break
			;;
		* )
			;;
	esac
	echo ""
done


while true; do
	read -p "Wanna use the *bash* from the repo (y/n)? " answer

	case "$answer" in
		[Yy]* )
			sudo rm -rf /home/$username/.bashrc
			sudo rm -rf /home/$username/.bash_profile
			sudo cp ./home/bashrc /home/$username/
			sudo cp ./home/bash_profile /home/$username/
			sudo mv ./home/bashrc /home/$username/.bashrc
			sudo mv ./home/bash_profile /home/$username/.bash_profile
			sudo chown $username /home/$username/.bashrc
			sudo chown $username /home/$username/.bash_profile
			break
			;;
		[Nn]* )
			break
			;;
		* )
			;;
	esac
	echo ""
done


while true; do
	read -p "Wanna wallpaper (y/n)? " answer

	case "$answer" in
		[Yy]* )
			git clone https://aur.archlinux.org/yay.git
			cd yay
			makepkg -si
			yay -S spotify swww wlogout
			sudo chmod +x /home/$username/.config/hypr/scripts/rofi-wallpaper.sh
			sudo cp -r ./home/pictures/ /home/$username/
			break 
			;;
		[Nn]* )
			break
			;;
		* )
			;;
	esac
	echo ""
done


echo "done!!"
sudo reboot
