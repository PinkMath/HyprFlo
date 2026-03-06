>[!NOTE]
>Save your wallpapers in the `pictures` folder

-- If you wanna, here's few shortcuts to add in `.bashrc` and `.bash_profile`:

## bashrc:

```bash
alias update='sudo pacman -Syu && sudo pacman -Sy && yay'
alias cleanshot='rm -rf ~/screenshot/output/* && rm -rf ~/screenshot/region/* && rm -rf ~/screenshot/window/*'
alias nvidia='sudo mkinitcpio -P'
alias resetwaybar='killall waybar && hyprctl dispatch exec waybar'
alias resetwallpaper='killall hyprpaper && hyprctl dispatch exec hyprpaper'
```

## bash_profile:

```bash
if [ "$(tty)" = "/dev/tty1" ]; then
  exec start-hyprland
fi
```

## Tmux

- The tmux config u need to rename as `.tmux.conf` to work when you put the file on the home
