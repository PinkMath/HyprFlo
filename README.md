# HyprFlo

<div align="center">

**A clean, fast, personal Arch Linux + Hyprland dotfiles setup.**

Made for a minimal Wayland desktop with Hyprland, Waybar, Rofi, Kitty, Neovim, Dunst, Wlogout, rmpc, and a small offline music workflow.

</div>

---

## Preview

<p align="center">
  <img src="https://github.com/user-attachments/assets/d9c6e2f4-10d0-4b99-88da-76c7ca3c41f7" width="32%" />
  
  <img src="https://github.com/user-attachments/assets/55e4e50f-9679-4d9a-bbce-50158d0dbdad" width="32%" />
  
  <img src="https://github.com/user-attachments/assets/223ee0f4-4068-4420-b06f-cb34a21111cb" width="32%" />
</p>

---

## About

HyprFlo is my personal Hyprland rice for Arch Linux. It is built around a simple idea: keep the desktop pretty, fast, and comfortable without making it bloated.

It includes configs for:

* **Hyprland** — Wayland compositor
* **Waybar** — top bar
* **Rofi** — app launcher and menus
* **Kitty** — terminal
* **Neovim** — editor setup
* **Dunst** — notifications
* **Wlogout** — power menu
* **Nemo** — file manager
* **rmpc / MPD** — offline music player setup
* **Zsh / tmux / CLI tools** — shell workflow

> [!IMPORTANT]
> This setup is made for **Arch Linux** or Arch-based systems.
>
> Before installing, enable `[multilib]` in `/etc/pacman.conf` if you want Steam, 32-bit support, gaming packages, or some AUR apps.

---

## Features

* Minimal Hyprland desktop
* Clean Waybar setup
* Rofi launcher and menus
* Screenshot keybinds using Hyprshot
* Dunst notification controls
* Wlogout power menu
* Hyprlock lockscreen
* Nemo as the file manager
* Neovim configuration
* Kitty terminal setup
* Zsh + useful CLI tools
* Optional NVIDIA package setup
* Optional offline music setup using MPD, MPC, and rmpc
* Installer script with backups for existing configs

---

## Requirements

### Base system

You need an Arch-based system with `pacman`.

Main packages used by HyprFlo:

```bash
sudo pacman -S --needed \
  base-devel \
  git \
  lazygit \
  wireplumber \
  dunst \
  grim \
  hyprland \
  hyprshot \
  hyprlock \
  kitty \
  nemo \
  neovim \
  pavucontrol \
  playerctl \
  brightnessctl \
  rofi \
  slurp \
  tmux \
  unzip \
  zip \
  waybar \
  wlogout \
  fastfetch \
  eza \
  bat \
  zoxide \
  btop \
  xdg-user-dirs \
  zsh \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  wl-clipboard \
  cliphist
```

### Optional NVIDIA packages

```bash
sudo pacman -S --needed \
  nvidia-dkms \
  nvidia-settings \
  nvidia-utils \
  lib32-nvidia-utils \
  vulkan-icd-loader \
  lib32-vulkan-icd-loader
```

### Optional music packages

```bash
sudo pacman -S --needed mpd mpc rmpc
```

### Recommended font

HyprFlo is designed to be used with a Nerd Font.

Recommended:

```text
0xProto Nerd Font
```

---

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/PinkMath/HyprFlo.git
cd HyprFlo
```

### 2. Run the installer

```bash
chmod +x installer.sh
./installer.sh
```

The installer can:

* install required packages
* optionally install MPD/rmpc music packages
* optionally install NVIDIA packages
* optionally install `yay`
* optionally install AUR apps like LibreWolf and Vesktop
* back up existing configs before replacing them
* copy HyprFlo configs into `~/.config`
* copy home files like `.zshrc`, `.zprofile`, and `.tmux.conf`
* fix script permissions
* optionally set Zsh as the default shell
* optionally auto-start Hyprland from TTY1

> [!WARNING]
> This is a personal dotfiles setup. Read the installer before running it, especially if you already have important configs in `~/.config`, `.zshrc`, `.zprofile`, or `.tmux.conf`.

### Manual install

If you prefer copying things yourself:

```bash
cp -r config/* ~/.config/
cp -r home/.* ~/
chmod +x ~/.config/hypr/script/*.sh
hyprctl reload
```

Or log out and log back in.

---

## AUR packages

Install `yay` if you do not have it yet:

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

Optional AUR apps:

```bash
yay -S --needed librewolf-bin vesktop
```

---

## Offline Music Player

HyprFlo includes a minimal offline music workflow using:

* `mpd` as the music server
* `mpc` for command-line control
* `rmpc` as the terminal music player UI

Install the packages:

```bash
sudo pacman -S --needed mpd mpc rmpc
```

Music should live inside:

```text
~/Music/
```

Example structure:

```text
~/Music/
└── music/
    └── Artist/
        └── Album/
            └── song.flac
```

Create an MPD playlist from a folder:

```bash
mkdir -p ~/.config/mpd/playlists

find ~/Music/music -type f \
  \( -iname "*.flac" -o \
     -iname "*.mp3"  -o \
     -iname "*.m4a"  -o \
     -iname "*.ogg"  -o \
     -iname "*.opus" -o \
     -iname "*.wav" \) \
  | sed "s|$HOME/Music/||" \
  | sort > ~/.config/mpd/playlists/music.m3u

mpc update
```

Play it:

```bash
mpc clear
mpc load music
mpc play
rmpc
```

---

## Soulseek / YouTube music helper

HyprFlo can be used with a custom `slsk` helper script for organizing offline music.

Example commands:

```bash
slsk
slsk -y "https://youtube.com/playlist?list=..."
slsk -csv ~/Music/playlists-backup/playlist.csv
slsk -g ~/Downloads/songs
```

Suggested alias:

```bash
alias slsk="$HOME/.config/rmpc/script/slsk-flow"
```

Expected behavior:

* `slsk` opens an interactive menu
* `slsk -y <url>` downloads YouTube audio into `~/Music`, then moves it into a playlist folder
* `slsk -csv <file.csv>` downloads from Soulseek into `~/Music`, then moves songs into a playlist folder
* `slsk -g <path>` moves existing local songs into a playlist folder
* MPD playlists are generated inside `~/.config/mpd/playlists`

> [!NOTE]
> Only download music you have the right or permission to download.

---

## Keybinds

### Launchers

| Keybind                 | Action                 |
| ----------------------- | ---------------------- |
| `Super + Return`        | Open terminal          |
| `Super + E`             | Open file manager      |
| `Super + Space`         | Open Rofi app launcher |
| `Super + Shift + Space` | Change wallpaper       |
| `Alt + B`               | Launch browser         |
| `Alt + S`               | Launch rmpc            |
| `Alt + D`               | Launch Vesktop         |

### Power / Lock

| Keybind     | Action          |
| ----------- | --------------- |
| `Super + P` | Open power menu |
| `Super + O` | Lock screen     |

### Media Controls

| Keybind       | Action                    |
| ------------- | ------------------------- |
| `Alt + Space` | Play / pause current song |
| `Alt + Left`  | Previous song             |
| `Alt + Right` | Next song                 |
| `Alt + Up`    | Increase music volume     |
| `Alt + Down`  | Decrease music volume     |

### Special Workspace

| Keybind             | Action                                 |
| ------------------- | -------------------------------------- |
| `Super + T`         | Toggle magic workspace                 |
| `Super + Shift + G` | Move focused window to magic workspace |
| `Super + G`         | Move focused window to workspace 2     |

The magic workspace is useful for temporary or floating apps like rmpc, Vesktop, or scratchpad windows.

### Screenshots

| Keybind     | Action                     |
| ----------- | -------------------------- |
| `Super + X` | Screenshot selected region |
| `Super + Z` | Screenshot full screen     |
| `Super + C` | Screenshot focused window  |

### Notifications

| Keybind             | Action                              |
| ------------------- | ----------------------------------- |
| `Super + N`         | Show last notification from history |
| `Super + Shift + N` | Close all notifications             |
| `Super + Ctrl + N`  | Pause / unpause notifications       |

### Window Management

| Keybind             | Action              |
| ------------------- | ------------------- |
| `Super + Q`         | Close active window |
| `Super + F`         | Toggle floating     |
| `Super + I`         | Toggle fullscreen   |
| `Super + H`         | Focus left          |
| `Super + L`         | Focus right         |
| `Super + K`         | Focus up            |
| `Super + J`         | Focus down          |
| `Super + Shift + H` | Swap window left    |
| `Super + Shift + L` | Swap window right   |
| `Super + Shift + K` | Swap window up      |
| `Super + Shift + J` | Swap window down    |

### Workspaces

| Keybind             | Action                              |
| ------------------- | ----------------------------------- |
| `Super + 1`         | Switch to workspace 1               |
| `Super + 2`         | Switch to workspace 2               |
| `Super + 3`         | Switch to workspace 3               |
| `Super + 4`         | Switch to workspace 4               |
| `Super + 5`         | Switch to workspace 5               |
| `Super + 6`         | Switch to workspace 6               |
| `Super + 7`         | Switch to workspace 7               |
| `Super + 8`         | Switch to workspace 8               |
| `Super + 9`         | Switch to workspace 9               |
| `Super + 0`         | Switch to workspace 10              |
| `Super + Shift + 1` | Move focused window to workspace 1  |
| `Super + Shift + 2` | Move focused window to workspace 2  |
| `Super + Shift + 3` | Move focused window to workspace 3  |
| `Super + Shift + 4` | Move focused window to workspace 4  |
| `Super + Shift + 5` | Move focused window to workspace 5  |
| `Super + Shift + 6` | Move focused window to workspace 6  |
| `Super + Shift + 7` | Move focused window to workspace 7  |
| `Super + Shift + 8` | Move focused window to workspace 8  |
| `Super + Shift + 9` | Move focused window to workspace 9  |
| `Super + Shift + 0` | Move focused window to workspace 10 |

### Mouse Controls

| Keybind               | Action        |
| --------------------- | ------------- |
| `Super + Mouse Left`  | Move window   |
| `Super + Mouse Right` | Resize window |

### Laptop Keys

| Keybind                 | Action                    |
| ----------------------- | ------------------------- |
| `XF86AudioRaiseVolume`  | Increase volume by 5%     |
| `XF86AudioLowerVolume`  | Decrease volume by 5%     |
| `XF86AudioMute`         | Toggle mute               |
| `XF86AudioMicMute`      | Toggle microphone mute    |
| `XF86MonBrightnessUp`   | Increase brightness by 5% |
| `XF86MonBrightnessDown` | Decrease brightness by 5% |

### Player Controls

Requires `playerctl`.

| Keybind          | Action         |
| ---------------- | -------------- |
| `XF86AudioNext`  | Next track     |
| `XF86AudioPrev`  | Previous track |
| `XF86AudioPlay`  | Play / pause   |
| `XF86AudioPause` | Play / pause   |

---

## Folder Structure

```text
HyprFlo/
├── config/
│   ├── dunst/
│   ├── fastfetch/
│   ├── hypr/
│   ├── kitty/
│   ├── nvim/
│   ├── rofi/
│   ├── waybar/
│   ├── wlogout/
│   └── rmpc/
├── home/
├── installer.sh
└── README.md
```

---

## Things to edit for your own machine

This is my personal setup, so check these before using it as-is:

* monitor names and resolution
* default terminal
* default browser
* wallpaper paths
* keyboard layout
* NVIDIA settings, if you use NVIDIA
* installed fonts
* personal scripts inside `~/.config/hypr/script`
* music paths, if using MPD/rmpc

---

## Updating

Pull the latest changes:

```bash
git pull
```

Then either rerun the installer:

```bash
./installer.sh
```

or manually copy only the configs you want.

---

## Credits

Made by [PinkMath](https://github.com/PinkMath).

I use Arch BTW.
