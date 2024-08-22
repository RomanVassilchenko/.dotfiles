{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome = {
    enable = true;
    extraGSettingsOverridePackages = [ pkgs.gnome.mutter ];
    extraGSettingsOverrides = ''
      [org.gnome.mutter]
      experimental-features=['scale-monitor-framebuffer']
    '';
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome-connections
    totem
    epiphany
  ]) ++ (with pkgs.gnome; [
    # for packages that are pkgs.gnome.*
    # epiphany # web browser
    # totem # video player
    # geary # email reader
    # evince # document viewer
  ]);

  environment.systemPackages = with pkgs; [
    celluloid
    gnome-tweaks

    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
  ];
}
