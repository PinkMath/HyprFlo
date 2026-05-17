#!/usr/bin/env bash
# HyprFlo installer
# https://github.com/PinkMath/HyprFlo

set -Eeuo pipefail

REPO_URL="https://github.com/PinkMath/HyprFlo.git"
REPO_DIR="${REPO_DIR:-$PWD}"
BACKUP_DIR="$HOME/.hyprflo-backup-$(date +%Y%m%d-%H%M%S)"

PACMAN_PACKAGES=(
  base-devel
  git
  wireplumber
  dunst
  grim
  hyprland
  hyprshot
  hyprlock
  kitty
  nemo
  neovim
  pavucontrol
  playerctl
  brightnessctl
  rofi
  slurp
  tmux
  unzip
  zip
  waybar
  wlogout
  fastfetch
  eza
  bat
  zoxide
  btop
  xdg-user-dirs
  zsh
  zsh-autosuggestions
  zsh-syntax-highlighting
  wl-clipboard
  cliphist
)

MUSIC_PACKAGES=(
  mpd
  mpc
  rmpc
)

NVIDIA_PACKAGES=(
  nvidia-dkms
  nvidia-settings
  nvidia-utils
  lib32-nvidia-utils
  vulkan-icd-loader
  lib32-vulkan-icd-loader
)

AUR_PACKAGES=(
  librewolf-bin
  vesktop
)

BOLD="$(printf '\033[1m')"
RESET="$(printf '\033[0m')"
GREEN="$(printf '\033[32m')"
YELLOW="$(printf '\033[33m')"
RED="$(printf '\033[31m')"
BLUE="$(printf '\033[34m')"

INSTALL_MUSIC="false"

log() {
  printf "%s==>%s %s\n" "$BLUE" "$RESET" "$*"
}

ok() {
  printf "%s✓%s %s\n" "$GREEN" "$RESET" "$*"
}

warn() {
  printf "%s!%s %s\n" "$YELLOW" "$RESET" "$*"
}

die() {
  printf "%sERROR:%s %s\n" "$RED" "$RESET" "$*" >&2
  exit 1
}

ask_yes_no() {
  local prompt="$1"
  local default="${2:-n}"
  local reply

  if [[ "$default" == "y" ]]; then
    prompt="$prompt [Y/n] "
  else
    prompt="$prompt [y/N] "
  fi

  read -r -p "$prompt" reply || true
  reply="${reply:-$default}"

  [[ "$reply" =~ ^[Yy]$ ]]
}

has_cmd() {
  command -v "$1" >/dev/null 2>&1
}

ensure_arch() {
  if ! has_cmd pacman; then
    die "This installer is made for Arch-based systems with pacman."
  fi
}

ensure_not_root() {
  if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
    die "Do not run this script as root. Run it as your normal user."
  fi
}

detect_repo_dir() {
  if [[ -d "$REPO_DIR/config" && -d "$REPO_DIR/home" ]]; then
    return
  fi

  if [[ -d "$HOME/HyprFlo/config" && -d "$HOME/HyprFlo/home" ]]; then
    REPO_DIR="$HOME/HyprFlo"
    return
  fi

  if [[ -d "$HOME/.cache/HyprFlo/config" && -d "$HOME/.cache/HyprFlo/home" ]]; then
    REPO_DIR="$HOME/.cache/HyprFlo"
    return
  fi

  warn "Could not find HyprFlo files in the current directory."
  if ask_yes_no "Clone HyprFlo into ~/.cache/HyprFlo now?" "y"; then
    mkdir -p "$HOME/.cache"
    rm -rf "$HOME/.cache/HyprFlo"
    git clone "$REPO_URL" "$HOME/.cache/HyprFlo"
    REPO_DIR="$HOME/.cache/HyprFlo"
  else
    die "Run this installer from inside the HyprFlo repo."
  fi
}

install_pacman_packages() {
  log "Installing required pacman packages..."
  sudo pacman -Syu --needed "${PACMAN_PACKAGES[@]}"
  ok "Base packages installed."
}

install_music_packages() {
  if ask_yes_no "Install offline music player packages? (mpd mpc rmpc)" "n"; then
    INSTALL_MUSIC="true"
    log "Installing offline music packages..."
    sudo pacman -S --needed "${MUSIC_PACKAGES[@]}"
    ok "Offline music packages installed."
  else
    INSTALL_MUSIC="false"
    warn "Skipping offline music packages."
  fi
}

install_nvidia_packages() {
  if ask_yes_no "Install NVIDIA DKMS + Vulkan packages?" "n"; then
    sudo pacman -S --needed "${NVIDIA_PACKAGES[@]}"
    ok "NVIDIA packages installed."
    warn "After NVIDIA driver changes, reboot is recommended."
  fi
}

install_yay() {
  if has_cmd yay; then
    ok "yay is already installed."
    return
  fi

  if ! ask_yes_no "yay is not installed. Install yay from AUR?" "y"; then
    warn "Skipping yay and AUR packages."
    return
  fi

  log "Installing yay..."
  local build_dir
  build_dir="$(mktemp -d)"
  git clone https://aur.archlinux.org/yay.git "$build_dir/yay"
  (cd "$build_dir/yay" && makepkg -si --noconfirm)
  rm -rf "$build_dir"

  ok "yay installed."
}

install_aur_packages() {
  if ! has_cmd yay; then
    warn "yay is not installed; skipping AUR packages."
    return
  fi

  if ask_yes_no "Install optional AUR apps? (${AUR_PACKAGES[*]})" "n"; then
    yay -S --needed "${AUR_PACKAGES[@]}"
    ok "AUR apps installed."
  fi
}

backup_path() {
  local path="$1"

  if [[ -e "$path" || -L "$path" ]]; then
    mkdir -p "$BACKUP_DIR$(dirname "$path")"
    mv "$path" "$BACKUP_DIR$path"
    ok "Backed up $path"
  fi
}

copy_dir_contents() {
  local src="$1"
  local dest="$2"

  [[ -d "$src" ]] || return 0
  mkdir -p "$dest"

  shopt -s dotglob nullglob
  local item
  for item in "$src"/*; do
    local base
    base="$(basename "$item")"
    cp -r "$item" "$dest/$base"
  done
  shopt -u dotglob nullglob
}

install_dotfiles() {
  log "Installing HyprFlo configs from: $REPO_DIR"

  mkdir -p "$HOME/.config"

  local dirs=(dunst fastfetch hypr kitty nvim rofi waybar wlogout rmpc)
  local dir
  for dir in "${dirs[@]}"; do
    if [[ -e "$REPO_DIR/config/$dir" ]]; then
      backup_path "$HOME/.config/$dir"
    fi
  done

  backup_path "$HOME/.zshrc"
  backup_path "$HOME/.zprofile"
  backup_path "$HOME/.tmux.conf"

  copy_dir_contents "$REPO_DIR/config" "$HOME/.config"

  if [[ -f "$REPO_DIR/home/zshrc" ]]; then
    cp "$REPO_DIR/home/zshrc" "$HOME/.zshrc"
  fi

  if [[ -f "$REPO_DIR/home/zprofile" ]]; then
    cp "$REPO_DIR/home/zprofile" "$HOME/.zprofile"
  fi

  if [[ -f "$REPO_DIR/home/tmux.conf" ]]; then
    cp "$REPO_DIR/home/tmux.conf" "$HOME/.tmux.conf"
  fi

  if [[ -d "$REPO_DIR/home/pictures" ]]; then
    mkdir -p "$HOME/Pictures"
    cp -r "$REPO_DIR/home/pictures/"* "$HOME/Pictures/" 2>/dev/null || true
  fi

  ok "Dotfiles copied."
}

fix_permissions() {
  log "Fixing script permissions..."

  if [[ -d "$HOME/.config/hypr/script" ]]; then
    find "$HOME/.config/hypr/script" -type f -name "*.sh" -exec chmod +x {} \;
  fi

  ok "Permissions fixed."
}

setup_music() {
  if [[ "$INSTALL_MUSIC" != "true" ]]; then
    return
  fi

  log "Setting up MPD/rmpc offline music folders..."

  mkdir -p "$HOME/Music"
  mkdir -p "$HOME/.config/mpd/playlists"
  mkdir -p "$HOME/.local/bin"

  if [[ ! -f "$HOME/.config/mpd/mpd.conf" ]]; then
    cat > "$HOME/.config/mpd/mpd.conf" <<'MPD_CONF'
music_directory     "~/Music"
playlist_directory  "~/.config/mpd/playlists"
db_file             "~/.config/mpd/database"
log_file            "~/.config/mpd/log"
pid_file            "~/.config/mpd/pid"
state_file          "~/.config/mpd/state"
sticker_file        "~/.config/mpd/sticker.sql"

bind_to_address     "127.0.0.1"
port                "6600"

auto_update         "yes"

audio_output {
    type            "pipewire"
    name            "PipeWire Sound Server"
}

audio_output {
    type            "fifo"
    name            "Visualizer feed"
    path            "/tmp/mpd.fifo"
    format          "44100:16:2"
}
MPD_CONF
    ok "Created ~/.config/mpd/mpd.conf"
  else
    warn "~/.config/mpd/mpd.conf already exists; leaving it unchanged."
  fi

  cat > "$HOME/.local/bin/add-playlist" <<'ADD_PLAYLIST'
#!/usr/bin/env bash

set -e

PLAYLIST="$1"

if [ -z "$PLAYLIST" ]; then
  echo "Usage: add-playlist playlist-name"
  echo "Example: add-playlist game"
  exit 1
fi

MUSIC_DIR="$HOME/Music"
PLAYLIST_DIR="$MUSIC_DIR/$PLAYLIST"
MPD_PLAYLIST_DIR="$HOME/.config/mpd/playlists"
MPD_PLAYLIST_FILE="$MPD_PLAYLIST_DIR/$PLAYLIST.m3u"

mkdir -p "$PLAYLIST_DIR"
mkdir -p "$MPD_PLAYLIST_DIR"

echo "Moving loose music files to: $PLAYLIST_DIR"

find "$MUSIC_DIR" -maxdepth 1 -type f   \( -iname "*.flac" -o -iname "*.mp3" -o -iname "*.m4a" -o -iname "*.ogg" -o -iname "*.opus" -o -iname "*.wav" \)   -exec mv -n {} "$PLAYLIST_DIR/" \;

echo "Creating MPD playlist: $MPD_PLAYLIST_FILE"

find "$PLAYLIST_DIR" -type f   \( -iname "*.flac" -o -iname "*.mp3" -o -iname "*.m4a" -o -iname "*.ogg" -o -iname "*.opus" -o -iname "*.wav" \)   | sed "s|$HOME/Music/||"   | sort > "$MPD_PLAYLIST_FILE"

echo "Updating MPD..."
mpc update >/dev/null || true

echo "Done."
echo "Playlist created: $PLAYLIST"
echo "Play it with:"
echo "  music $PLAYLIST"
ADD_PLAYLIST

  chmod +x "$HOME/.local/bin/add-playlist"
  ok "Installed add-playlist helper."

  systemctl --user enable --now mpd || warn "Could not start mpd automatically. Try: systemctl --user enable --now mpd"
  mpc update >/dev/null || true
  ok "MPD/rmpc setup finished."
}

setup_zsh() {
  if ! has_cmd zsh; then
    warn "zsh is not installed; skipping shell setup."
    return
  fi

  if ! grep -qxF /usr/bin/zsh /etc/shells; then
    echo /usr/bin/zsh | sudo tee -a /etc/shells >/dev/null
  fi

  if ask_yes_no "Set zsh as your default shell?" "y"; then
    sudo usermod -s /usr/bin/zsh "$USER"
    ok "Default shell set to zsh. Log out and back in for it to apply."
  fi
}

setup_autostart() {
  if [[ ! -f "$HOME/.zprofile" ]]; then
    touch "$HOME/.zprofile"
  fi

  if grep -q "HyprFlo auto-start Hyprland" "$HOME/.zprofile"; then
    ok "Hyprland TTY autostart already exists in ~/.zprofile."
    return
  fi

  if ask_yes_no "Auto-start Hyprland when logging into TTY1?" "y"; then
    cat >> "$HOME/.zprofile" <<'ZPROFILE'

# HyprFlo auto-start Hyprland on TTY1
if [ -z "$WAYLAND_DISPLAY" ] && [ "${XDG_VTNR:-}" = "1" ]; then
  if command -v start-hyprland >/dev/null 2>&1; then
    exec start-hyprland
  else
    exec Hyprland
  fi
fi
ZPROFILE
    ok "Added Hyprland autostart to ~/.zprofile."
  fi
}

setup_user_dirs() {
  if has_cmd xdg-user-dirs-update; then
    xdg-user-dirs-update
    ok "User folders checked."
  fi
}

set_nemo_default() {
  if has_cmd xdg-mime && has_cmd nemo; then
    xdg-mime default nemo.desktop inode/directory || true
    xdg-mime default nemo.desktop application/x-gnome-saved-search || true
    ok "Nemo set as default file manager."
  fi
}

reload_hyprland() {
  if has_cmd hyprctl && [[ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]]; then
    hyprctl reload || true
    ok "Hyprland reloaded."
  else
    warn "Not inside Hyprland, so reload was skipped."
  fi
}

print_summary() {
  printf "\n%sHyprFlo install complete.%s\n" "$BOLD" "$RESET"

  if [[ -d "$BACKUP_DIR" ]]; then
    printf "Backup saved at: %s\n" "$BACKUP_DIR"
  fi

  cat <<SUMMARY

Next steps:
  1. Log out and log back in.
  2. If you installed NVIDIA packages, reboot.
  3. Open Hyprland.
  4. Check your monitor, browser, wallpaper, and font settings.

Useful commands:
  hyprctl reload
  pkill waybar && waybar &
  nemo
SUMMARY

  if [[ "$INSTALL_MUSIC" == "true" ]]; then
    cat <<MUSIC_SUMMARY

Music commands:
  add-playlist playlist-name
  mpc lsplaylists
  mpc clear && mpc load playlist-name && mpc play
  rmpc
MUSIC_SUMMARY
  fi
}

main() {
  printf "\n%sHyprFlo Installer%s\n\n" "$BOLD" "$RESET"

  ensure_not_root
  ensure_arch
  detect_repo_dir

  log "Repo directory: $REPO_DIR"

  install_pacman_packages
  install_music_packages
  install_nvidia_packages
  install_yay
  install_aur_packages

  install_dotfiles
  fix_permissions
  setup_user_dirs
  set_nemo_default
  setup_music
  setup_zsh
  setup_autostart
  reload_hyprland

  print_summary
}

main "$@"
