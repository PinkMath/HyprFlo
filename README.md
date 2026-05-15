# HyprFlo

Minimal Arch Linux + Hyprland dotfiles.

HyprFlo is my personal Hyprland setup focused on being clean, fast, and simple.
It includes configs for Hyprland, Waybar, Rofi, Kitty, Nemo, Neovim, Dunst, Wlogout, and wallpapers.

![HyprFlo Screenshot](./assets/screenshot.png)

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

Add your screenshots here:

```md
![Screenshot 1](./screenshots/screenshot1.png)
![Screenshot 2](./screenshots/screenshot2.png)
```

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
| `Alt + S` | Launch Spotify |
| `Alt + B` | Launch browser |
| `Alt + D` | Launch Vesktop |
| `Super + Space` | Open Rofi menu |
| `Super + Shift + Space` | Change wallpaper |
| `Super + E` | Open terminal |
| `Super + Shift + E` | Open file manager |

---

### Media Controls

| Keybind | Action |
|---|---|
| `Alt + Left` | Previous track |
| `Alt + Right` | Next track |
| `Alt + Up` | Increase volume |
| `Alt + Down` | Decrease volume |
| `Alt + Pause/Play` | Play or pause |

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
| `Super + 1-0` | Switch to workspace 1-10 |
| `Super + Alt + 1-0` | Move focused window to workspace 1-10 |

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
