{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-connections
    epiphany # web browser
    # geary # email reader. Up to 24.05. Starting from 24.11 the package name is just geary.
    # evince # document viewer
    totem
    gnome-console
  ];

  environment.systemPackages = with pkgs.gnomeExtensions; [
    # blur-my-shell
    # pop-shell
    # ...
    gsconnect
    appindicator
    just-perfection
    pano
    blur-my-shell
    dash-to-dock
    alphabetical-app-grid
    top-panel-workspace-scroll
    # tray-icons-reloaded
    weather-oclock
  ];

  xdg.portal = {
    enable = true;
    # xdgOpenUsePortal = true;
    extraPortals = [
      # pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
