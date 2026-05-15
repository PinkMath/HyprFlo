# HyprFlo

Minimal Arch Linux + Hyprland dotfiles.

HyprFlo is my personal Hyprland setup focused on being clean, fast, and simple.  
It includes configs for Hyprland, Waybar, Rofi, Kitty, Nemo, Neovim, Dunst, Wlogout, and wallpapers.

> [!IMPORTANT]
> This config is made for Arch Linux.
>
> Before installing, enable `[multilib]` in `/etc/pacman.conf` if you want 32-bit support, Steam, gaming packages, or some AUR apps.

> [!NOTE]
> This setup is designed to be used with a Nerd Font.
>
> Recommended font: **0xProto Nerd Font**

---

## Preview

![Screenshot 1](./screenshots/2026-05-15-161330_hyprshot.png)
![Screenshot 2](./screenshots/2026-05-15-153545_hyprshot.png)
![Screenshot 3](./screenshots/2026-05-15-153524_hyprshot.png)

---

## Requirements

Install the main packages:

```bash
sudo pacman -S \
  base-devel \
  wireplumber \
  dunst \
  grim \
  hyprland \
  hyprshot \
  kitty \
  nemo \
  neovim \
  pavucontrol \
  rofi \
  slurp \
  unzip \
  waybar \
  tmux \
  wlogout
```

Optional NVIDIA packages:

```bash
sudo pacman -S \
  nvidia-dkms \
  nvidia-settings \
  nvidia-utils \
  lib32-nvidia-utils \
  vulkan-icd-loader \
  lib32-vulkan-icd-loader
```

---

## Install yay

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

Install optional AUR apps:

```bash
yay -S spotify librewolf-bin vesktop
```

> If your setup uses a wallpaper tool, install the one you use, like `swww`, `hyprpaper`, or `waypaper`.

---

## Installation

Clone the repository:

```bash
git clone https://github.com/PinkMath/HyprFlo.git
cd HyprFlo
```

Copy the config files:

```bash
cp -r config/* ~/.config/
cp -r home/.* ~/
```

Make scripts executable:

```bash
chmod +x ~/.config/hypr/script/*.sh
```

Reload Hyprland:

```bash
hyprctl reload
```

Or log out and log back in.

---

## Keybinds

### Launchers

| Keybind | Action |
|---|---|
| `Super + Return` | Open terminal |
| `Super + E` | Open file manager |
| `Super + Space` | Open Rofi app launcher |
| `Super + Shift + Space` | Change wallpaper |
| `Alt + B` | Launch browser |
| `Alt + S` | Launch Spotify |
| `Alt + D` | Launch Vesktop |

---

### Power / Lock

| Keybind | Action |
|---|---|
| `Super + P` | Open power menu |
| `Super + O` | Lock screen |

---

### Media Controls

| Keybind | Action |
|---|---|
| `Alt + Left` | Previous Spotify track |
| `Alt + Right` | Next Spotify track |
| `Alt + Up` | Increase Spotify volume |
| `Alt + Down` | Decrease Spotify volume |
| `Alt + Space` | Play or pause Spotify |

---

### Special Workspace

| Keybind | Action |
|---|---|
| `Super + T` | Toggle magic workspace |
| `Super + Shift + G` | Move focused window to magic workspace |
| `Super + G` | Move focused window to workspace 2 |

The magic workspace is useful for temporary or floating apps like Spotify, Vesktop, or scratchpad windows.

---

### Screenshots

| Keybind | Action |
|---|---|
| `Super + X` | Screenshot selected region |
| `Super + Z` | Screenshot full screen |
| `Super + C` | Screenshot focused window |

---

### Notifications

| Keybind | Action |
|---|---|
| `Super + N` | Show last notification from history |
| `Super + Shift + N` | Close all notifications |
| `Super + Ctrl + N` | Pause or unpause notifications |

---

### Window Management

| Keybind | Action |
|---|---|
| `Super + Q` | Close active window |
| `Super + F` | Toggle floating |
| `Super + I` | Toggle fullscreen |
| `Super + H` | Focus left |
| `Super + L` | Focus right |
| `Super + K` | Focus up |
| `Super + J` | Focus down |
| `Super + Shift + H` | Swap window left |
| `Super + Shift + L` | Swap window right |
| `Super + Shift + K` | Swap window up |
| `Super + Shift + J` | Swap window down |

---

### Workspaces

| Keybind | Action |
|---|---|
| `Super + 1` | Switch to workspace 1 |
| `Super + 2` | Switch to workspace 2 |
| `Super + 3` | Switch to workspace 3 |
| `Super + 4` | Switch to workspace 4 |
| `Super + 5` | Switch to workspace 5 |
| `Super + 6` | Switch to workspace 6 |
| `Super + 7` | Switch to workspace 7 |
| `Super + 8` | Switch to workspace 8 |
| `Super + 9` | Switch to workspace 9 |
| `Super + 0` | Switch to workspace 10 |
| `Super + Shift + 1` | Move focused window to workspace 1 |
| `Super + Shift + 2` | Move focused window to workspace 2 |
| `Super + Shift + 3` | Move focused window to workspace 3 |
| `Super + Shift + 4` | Move focused window to workspace 4 |
| `Super + Shift + 5` | Move focused window to workspace 5 |
| `Super + Shift + 6` | Move focused window to workspace 6 |
| `Super + Shift + 7` | Move focused window to workspace 7 |
| `Super + Shift + 8` | Move focused window to workspace 8 |
| `Super + Shift + 9` | Move focused window to workspace 9 |
| `Super + Shift + 0` | Move focused window to workspace 10 |

---

### Mouse Controls

| Keybind | Action |
|---|---|
| `Super + Mouse Left` | Move window |
| `Super + Mouse Right` | Resize window |

---

### Laptop Keys

| Keybind | Action |
|---|---|
| `XF86AudioRaiseVolume` | Increase volume by 5% |
| `XF86AudioLowerVolume` | Decrease volume by 5% |
| `XF86AudioMute` | Toggle mute |
| `XF86AudioMicMute` | Toggle microphone mute |
| `XF86MonBrightnessUp` | Increase brightness by 5% |
| `XF86MonBrightnessDown` | Decrease brightness by 5% |

---

### Player Controls

Requires `playerctl`.

| Keybind | Action |
|---|---|
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |
| `XF86AudioPlay` | Play or pause |
| `XF86AudioPause` | Play or pause |

---

## Folder Structure

```txt
HyprFlo/
├── config/
│   ├── hypr/
│   ├── waybar/
│   ├── rofi/
│   ├── kitty/
│   ├── dunst/
│   └── nvim/
├── home/
└── README.md
```

---

## Notes

This is my personal setup, so some paths, apps, or keybinds may need to be changed for your machine.

Recommended things to check before using:

- default terminal
- default browser
- wallpaper script path
- monitor settings
- NVIDIA settings, if you use NVIDIA
- installed fonts

---

## Credits

Made by [PinkMath](https://github.com/PinkMath).

I use Arch BTW.
