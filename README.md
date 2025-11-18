<div align="center">
  

</div>

<div align="center">
  
# REQUISITES
</div>

**sudo**

```bash
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-hyprland wireplumber base base-devel blueman bluez bluez-utils dunst fastfetch firefox flatpak git grim htop hyprland hyprshot kitty linux-zen linux-zen-headers nano nemo neovim pavucontrol pipewire pipewire-alsa pipewire-pulse pipewire-jack ranger rofi slurp starship sxiv unzip waybar
```
<div align="center">
  
# START PIPEWIRE
</div>

```bash
systemctl --user status pipewire
systemctl --user start pipewire
systemctl --user enable pipewire
```
<div align="center">
  
# NVIDIA(dkms) / vulkan
</div>

```bash
sudo pacman -S vulkan-icd-loader lib32-vulkan-icd-loader
```

```bash
sudo pacman -S nvidia-dkms nvidia-settings nvidia-utils lib32-nvidia-utils
```

**git** (Download yay)

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

**yay**

```bash
yay -S spotify wlogout
```

<div align="center">
  
**wallpaper**
<br>
if ur using swww use the script/ in .config/hypr/script/
<br>
if ur using hyprpaper use the hyprpeper.conf in .config/hypr/hyprpaper.conf
</div>

<div align="center">

# SCRIPT

</div>

```bash
sudo chmod +x ~/.config/hypr/scripts/rofi-wallpaper.sh
```
<div align="center">
  
# turn files as yours
</div>

```bash
sudo chown {user} {the way to that file}
```

<div align="center">

# FONT
**Download 0xProto Nerd Font**
</div>

```bash
https://www.nerdfonts.com/font-downloads *<-site*
sudo mkdir -p ~/.local/share/fonts
sudo mv ~/Download/0xProto.zip ~/.local/share/fonts
cd ~/.local/share/fonts
sudo unzip 0xProto.zip
```
