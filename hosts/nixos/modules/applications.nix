{ config, pkgs, ... }:

{

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    git
    google-chrome
    vesktop
    telegram-desktop
    spotify
    vscode
    cartridges
    obs-studio
    gimp-with-plugins
    libreoffice-qt6-fresh
    thunderbird
    krita
    goldwarden
    kdePackages.kdenlive
    gnome.gnome-boxes
    inkscape-with-extensions
    postman
    dbeaver-bin
    papirus-icon-theme
#     jetbrains.goland
    fastfetch
    neovim
    insync
    zed-editor
    boxbuddy

    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-grub
    kdePackages.breeze-icons
    kdePackages.breeze-plymouth

    # home-manager
  ];
}
