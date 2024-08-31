{ config, pkgs, ... }:

{

  programs.firefox.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    git
    google-chrome
    vesktop
    telegram-desktop
    spotify
    vscode
    cartridges
    obs-studio
    obs-studio-plugins.obs-backgroundremoval
    gimp-with-plugins
    libreoffice-qt6-fresh
    thunderbird
    krita
    bitwarden-desktop
    kdePackages.kdenlive
    gnome.gnome-boxes
    inkscape-with-extensions
    postman
    dbeaver-bin
    papirus-icon-theme
    jetbrains.goland
    fastfetch
    insync
    zed-editor
    boxbuddy
    fzf
    zoxide
    bat
    fd
    ripgrep
    wget
    curl
    unzip
    gamescope

    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-grub
    kdePackages.breeze-icons
    kdePackages.breeze-plymouth
  ];
}
