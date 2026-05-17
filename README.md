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

<img width="1920" height="1080" alt="2026-05-16-215046_hyprshot" src="https://github.com/user-attachments/assets/d9c6e2f4-10d0-4b99-88da-76c7ca3c41f7" />
<img width="1920" height="1080" alt="2026-05-16-215002_hyprshot" src="https://github.com/user-attachments/assets/55e4e50f-9679-4d9a-bbce-50158d0dbdad" />
<img width="1920" height="1080" alt="2026-05-16-214951_hyprshot" src="https://github.com/user-attachments/assets/223ee0f4-4068-4420-b06f-cb34a21111cb" />


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
  wlogout \
  fastfetch \
  eza \
  bat \
  zoxide \
  btop \
  hyprlock \
  playerctl \
  brightnessctl \
  xdg-user-dirs \
  zsh \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  wl-clipboard \
  cliphist
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

## Offline Music Player

HyprFlo includes a minimal offline music setup using:

- `mpd` as the music server
- `mpc` for command-line controls
- `rmpc` as the terminal music player UI

### Install music packages

```bash
sudo pacman -S mpd mpc rmpc
```

### Music folder structure

Put music inside `~/Music`.

Example:
```
~/Music/
  └── music/
      └── Artist/
          └── Album/
              └── song.flac
```

### Create an MPD playlist from a folder

Example for a playlist folder called `music`:
```bash
find ~/Music/music -type f \( -iname "*.flac" -o -iname "*.mp3" -o -iname "*.m4a" -o -iname "*.ogg" -o -iname "*.opus" -o -iname "*.wav" \) \
  | sed "s|$HOME/Music/||" \
  | sort > ~/.config/mpd/playlists/music.m3u
```

Update MPD:
```bash
mpc update
```

Play the plylist:
```bash
mpc clear
mpc load senai
mpc play
rmpc
```

If you're using SoulSeek + slsk it gonna be useful(just be careful here do u run it):
```bash
#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# 1. Check if the CSV file argument was provided
if [ -z "$1" ]; then
    echo "❌ Error: Please provide a CSV file."
    echo "Usage: slsk-flow yourfile.csv"
    exit 1
fi


CSV_FILE="$1"

# 2. Ask the user for the destination folder name
echo -n "📁 Enter the name for the destination folder/playlist: "
read -r FOLDER_NAME

if [ -z "$FOLDER_NAME" ]; then
    echo "❌ Error: Folder name cannot be empty."
    exit 1
fi

echo "🚀 Starting Soulseek download for list: $CSV_FILE..."

# 3. Change directory to Music and run the downloader
~/Soulseek\ Downloads/sldl "$CSV_FILE" --user YOURUSERNAME --pass YOURPASSWORD --name-format "{artist} - {title}" --pref-format flac

echo "📂 Organizing downloaded files into folder: '$FOLDER_NAME'..."

# 4. Create the target directory
mkdir -p "$FOLDER_NAME"

# 5. Move the newly downloaded files from ~/Music into the new folder
# (Using -maxdepth 1 to make sure we don't accidentally pull from other folders)
find ~/Music -maxdepth 1 -type f \( -iname "*.flac" -o -iname "*.ogg" -o -iname "*.opus" -o -iname "*.mp3" -o -iname "*.m4a" \) -exec mv {} ~/Music/"$FOLDER_NAME"/ \;

echo "🎵 Generating M3U playlist..."

# 6. Create the playlist file for MPD
find ~/Music/"$FOLDER_NAME" -type f \( -iname "*.flac" -o -iname "*.mp3" -o -iname "*.m4a" -o -iname "*.ogg" -o -iname "*.opus" \) \
  | sed "s|$HOME/Music/||" \
  | sort > ~/.config/mpd/playlists/"$FOLDER_NAME".m3u

echo "🔄 Updating MPD library..."

# 7. Update MPC
mpc update

echo "✅ Done! Your music is downloaded, organized, and added to MPD."
```

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
