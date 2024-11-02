{
  inputs,
  username,
  host,
  ...
}:
{
  imports = [
    ./audacious.nix # music player
    ./cava.nix # audio visualizer
    ./hyprland # window manager
    ./swayosd.nix # brightness / volume wiget
    ./swaync/swaync.nix # notification deamon
    ./nemo.nix # file manager
    ./retroarch.nix
    ./rofi.nix # launcher
    ./scripts/scripts.nix # personal scripts
    ./spicetify.nix # spotify client
    ./swaylock.nix # lock screen
    ./viewnior.nix # image viewer
    ./waybar # status bar
    ./xdg-mimes.nix # xdg config
  ];
}
