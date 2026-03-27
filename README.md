# observer
dotfiles for a Hyprland setup on CachyOS

For laptop:

Edited logind.conf in /etc/systemd/

HandleLidSwitch=suspend
HandleLidSwitchExternalPower=ignore
HandlePowerKey=suspend

followed by sudo systemctl restart systemd-logind
(might result in black screen. powered off and on to fix)

(WIP)

- Authentication agent: hyprpolkitagent
- terminal: kitty
- wallpaper: waypaper + swaybg
- notification daemon: swaync
- application launcher: rofi
- file manager: yazi / dolphin (temporary)
- audio: pipewire / wireplumber
- desktop portal: xdg-desktop-portal-hyprland
- status bar / shell:
- clipboard: wl-copy

Applications installed:

via pacman:

- kitty
- hyprland
- rofi
- swaync
- code
- dolphin
- yazi
- pipewire
- wireplumber
- hyprpolkitagent
- xdg-desktop-portal-hyprland
- btop
- stow
- waypaper
- swaybg
- yay
- hypridle
- hyprlock