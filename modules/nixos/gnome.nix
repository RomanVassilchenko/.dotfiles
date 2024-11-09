{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    gnome-connections
    epiphany
    totem
    gnome-console
  ];

  environment.systemPackages = with pkgs.gnomeExtensions; [
    gsconnect
    appindicator
    just-perfection
    pano
    blur-my-shell
    dash-to-dock
    alphabetical-app-grid
    top-panel-workspace-scroll
    weather-oclock
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
