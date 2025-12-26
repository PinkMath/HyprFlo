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

```bash
sudo systemctl start pipewire
sudo systemctl enable pipewire
```

```bash
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
```
  
# NVIDIA(dkms)/vulkan - if you need

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

# COMMANDS

-- Launche

| commands | Exec |
| ------------- | ------------- |
| ALT + S | Spotify |
| ALT + D | Vesktop |
| ALT + B | Firefox |
| Super + Space | Apps |
| Super + Shift + Space | Change wallpapers |
| Super + E | Terminal |
| Super + Shift + E | Filemanager |

##

-- Spotify

| commands | Exec |
| ------------- | ------------- |
| ALT + left_arrow | Play/Pause |
| ALT + right_arrow | Next soung |
| ALT + up_arrow | Turn up the volume |
| ALT + down_arrow | Turn down the volume |

##

-- Print

| commands | Exec |
| ------------- | ------------- |
| Super + X | Print - region |
| Super + Z | Print - screen |
| Super + C | Print - window |

##

-- Geral

| commands | Exec |
| ------------- | ------------- |
| Super + Q | Kill active |
| Super + I | Fullscreen |
| Super + F | Toggle floating |
| Super + O | Toggle split |
| Super + H | Focus window - left |
| Super + J | Focus window - down |
| Super + K | Focus window - up |
| Super + L | Focus window - right |
| Super + Shift + H | Move window - left |
| Super + Shift + J | Move window - down |
| Super + Shift + K | Move window - up |
| Super + Shift + L | Move window - right |

##

-- Workspaces

| commands | Exec |
| ------------- | ------------- |
| Super + [1-0] | Move workspace - [1-10] |
| Super + Shift + [1-0] | Move to workspace - [1-10] |

##

-- Mouse

| commands | Exec |
| ------------- | ------------- |
| Super + Mouse_left_click | Move window |
| Super + Mouse_right_click | Resize window |
