<div align="center">
  <img height="1080" alt="2026-05-15-060758_hyprshot" src="https://github.com/user-attachments/assets/5dc676b7-9a37-4a74-8ef8-e3989b036e1f" />
<img height="1080" alt="2026-05-15-060736_hyprshot" src="https://github.com/user-attachments/assets/0edb4258-9342-47d0-9e91-4fff9d7104e2" />

</div>

##

>[!IMPORTANT]
>Don't forget to enable **[multilib]** at `/etc/pacman.conf`.

>[!NOTE]
>This config's meant to be used with the Nerd Font **0xProto**.

# REQUISITES

```bash
sudo pacman -S wireplumber base-devel dunst grim hyprland hyprshot kitty nemo neovim pavucontrol rofi slurp unzip waybar tmux
```

# NVIDIA(dkms)/vulkan - if u want

```bash
sudo pacman -S nvidia-dkms nvidia-settings nvidia-utils lib32-nvidia-utils
```

```bash
sudo pacman -S vulkan-icd-loader lib32-vulkan-icd-loader
```

# Download **YAY**


```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

```bash
yay -S spotify awww wlogout librewolf-bin vesktop
```

# SCRIPT

```bash
sudo chmod +x ~/.config/hypr/script/rofi-wallpaper.sh
```

# COMMANDS

-- Launche

| Key                   | Action                 |
| --------------------- | ---------------------- |
| `Alt + S`             | Launch Spotify         |
| `Alt + B`             | Launch default browser |
| `Alt + D`             | Launch Vesktop         |
| `Super + Space`       | Launch menu            |
| `Super + Shift + Space` | Change wallpaper       |
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
