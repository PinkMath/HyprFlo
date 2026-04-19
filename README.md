<div align="center">
  <img width="800" alt="2026-04-19-142807_hyprshot" src="https://github.com/user-attachments/assets/d5b8d7d9-4ee0-4804-b5be-fa641c05ef1f" />
  <img width="800" alt="2026-04-19-142734_hyprshot" src="https://github.com/user-attachments/assets/5756abc2-8ea2-4a55-b580-b51ca80c28dc" />

</div>

##

>[!IMPORTANT]
>Don't forget to enable **[multilib]** at `/etc/pacman.conf`.

>[!NOTE]
>This config's meant to be used with the Nerd Font **0xProto**.
  
# REQUISITES

```bash
sudo pacman -S wireplumber base-devel blueman bluez bluez-utils dunst fastfetch grim hyprland hyprshot ghostty nano nemo neovim pavucontrol pipewire pipewire-alsa pipewire-pulse rofi slurp sxiv unzip waybar tmux
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
yay -S spotify swww wlogout zen-browser vesktop
```

# SCRIPT

```bash
sudo chmod +x ~/.config/hypr/scripts/rofi-wallpaper.sh
```

# COMMANDS

-- Launche

| Key                   | Action                 |
| --------------------- | ---------------------- |
| `Alt + S`             | Launch Spotify         |
| `Alt + B`             | Launch default browser |
| `Alt + D`             | Launch Vesktop         |
| `Super + Space`       | Launch menu            |
| `Super + Alt + Space` | Change wallpaper       |
| `Super + E`           | Open terminal          |
| `Super + Shift + E`   | Open file manager      |

-- Spotify / Media Control

| Key                | Action          |
| ------------------ | --------------- |
| `Alt + Left`       | Previous track  |
| `Alt + Right`      | Next track      |
| `Alt + Up`         | Increase volume |
| `Alt + Down`       | Decrease volume |
| `Alt + Pause/Play` | Play/Pause      |

-- Special Workspace

- Magic workspace toggle: `Super + T`

- Move focused window to magic workspace: `Super + Shift + G`

- Move focused window to workspace 2: `Super + G`

> The magic workspace is ideal for temporary or floating windows like Spotify, Vesktop, or scratchpad apps.

-- Print / Screenshots

| Key         | Action                |
| ----------- | --------------------- |
| `Super + X` | Print selected region |
| `Super + Z` | Print full screen     |
| `Super + C` | Print focused window  |

-- Window Management

| Key                       | Action                          |
| ------------------------- | ------------------------------- |
| `Super + Q`               | Close active window             |
| `Super + F`               | Toggle floating                 |
| `Super + I`               | Toggle fullscreen               |
| `Super + H/L/K/J`         | Move focus left/right/up/down   |
| `Super + Shift + H/L/K/J` | Swap windows left/right/up/down |

-- Workspace Navigation

| Key                 | Action                                |
| ------------------- | ------------------------------------- |
| `Super + 1-0`       | Switch to workspace 1–10              |
| `Super + Alt + 1-0` | Move focused window to workspace 1–10 |

-- Mouse Window Controls

| Key                   | Action        |
| --------------------- | ------------- |
| `Super + Mouse Left`  | Move window   |
| `Super + Mouse Right` | Resize window |

-- Laptop Multimedia Keys

| Key                     | Action                    |
| ----------------------- | ------------------------- |
| `XF86AudioRaiseVolume`  | Increase volume by 5%     |
| `XF86AudioLowerVolume`  | Decrease volume by 5%     |
| `XF86AudioMute`         | Toggle mute               |
| `XF86AudioMicMute`      | Toggle mic mute           |
| `XF86MonBrightnessUp`   | Increase brightness by 5% |
| `XF86MonBrightnessDown` | Decrease brightness by 5% |

-- Additional Player Controls (Requires `playerctl`)

| Key                              | Action         |
| -------------------------------- | -------------- |
| `XF86AudioNext`                  | Next track     |
| `XF86AudioPrev`                  | Previous track |
| `XF86AudioPlay / XF86AudioPause` | Play / Pause   |
