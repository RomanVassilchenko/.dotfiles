{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    # vesktop
    cartridges
    libreoffice-qt6-fresh
    thunderbird
    krita
    bitwarden-desktop
    kdePackages.kdenlive
    gnome-boxes
    dbeaver-bin
    papirus-icon-theme
    # jetbrains.goland
    # insync
    boxbuddy
    fd
    gnome-disk-utility
    lazygit
    lazydocker
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-grub
    kdePackages.breeze-icons
    kdePackages.breeze-plymouth
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.flatpak.enable = true;
  services.flatpak.packages = [
    {
      appId = "io.github.zen_browser.zen";
      origin = "flathub";
    }
    # "com.obsproject.Studio"
    # "im.riot.Riot"
  ];
}
