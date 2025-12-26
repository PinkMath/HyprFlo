>[!NOTE]
>Save your wallpapers in the `pictures` file

-- If you wanna, here's few shortcuts to add in `.bashrc` and `.bash_profile`:

##

-- bashrc:
`
alias update='sudo pacman -Syu && sudo pacman -Sy && yay'
alias cleanshot='rm -rf ~/screenshot/output/* && rm -rf ~/screenshot/region/* && rm -rf ~/screenshot/window/*'
alias nvidia='sudo mkinitcpio -P'
alias resetwaybar='killall waybar && hyprctl dispatch exec waybar'
alias resetwallpaper='killall hyprpaper && hyprctl dispatch exec hyprpaper'
`

##

-- bash_profile:
`
if [ "$(tty)" = "/dev/tty1" ]; then
  exec Hyprland
fi
`
