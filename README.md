>[!IMPORTANT]
>Dont forget to enable **[multilib]** at `/etc/pacman.conf`.

>[!NOTE]
>This config's meant to be used with the Nerd Font **0xProto** and Vesktop insted of Discord.

[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Fira+Code&weight=700&size=22&pause=1000&color=F7077E&vCenter=true&width=435&height=30&lines=INSTALLATION)](https://git.io/typing-svg)
  
# REQUISITES

```bash
sudo pacman -S wireplumber base-devel blueman bluez bluez-utils dunst fastfetch firefox grim hyprland hyprshot kitty nano nemo neovim pavucontrol pipewire pipewire-alsa pipewire-pulse pipewire-jack rofi slurp sxiv unzip waybar
```
  
# START PIPEWIRE/BLUETOOTH

-- Pipewire


```bash
sudo systemctl start pipewire
sudo systemctl enable pipewire
```

-- Bluetooth

```bash
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
```
  
# NVIDIA(dkms) / vulkan

```bash
sudo pacman -S vulkan-icd-loader lib32-vulkan-icd-loader
```

```bash
sudo pacman -S nvidia-dkms nvidia-settings nvidia-utils lib32-nvidia-utils
```

# Download **YAY**


```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

```bash
yay -S spotify swww wlogout
```

# SCRIPT

```bash
sudo chmod +x ~/.config/hypr/scripts/rofi-wallpaper.sh
```
