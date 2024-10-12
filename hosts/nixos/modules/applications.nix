{
  config,
  pkgs,
  lib,
  ...
}:

let
  extraPackages = with pkgs; [
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
in
{
  # programs.firefox.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = lib.mkMerge [
    config.environment.systemPackages
    extraPackages
  ];

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
