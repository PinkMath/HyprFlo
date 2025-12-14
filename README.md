[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Fira+Code&weight=700&size=22&pause=1000&color=F7077E&vCenter=true&width=435&height=30&lines=INSTALLATION)](https://git.io/typing-svg)

  >[!IMPORTANT]
  >The auto instaler still in development, *not recomended*

  >[!NOTE]  
  >Dont forget to enable **[multilib]** at `/etc/pacman.conf`.

<div align="center">
  
# REQUISITES
</div>

**sudo**

```bash
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-hyprland wireplumber base base-devel blueman bluez bluez-utils dunst fastfetch firefox flatpak git grim htop hyprland hyprshot kitty nano nemo neovim pavucontrol pipewire pipewire-alsa pipewire-pulse pipewire-jack rofi slurp starship sxiv unzip waybar
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
yay -S spotify swww spicetify-cli wlogout
```

**spicetify**

```bash
try:
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

if doesnt work, try:
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R
```

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
