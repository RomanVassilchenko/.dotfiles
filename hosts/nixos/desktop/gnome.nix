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
  ]) ++ (with pkgs.gnome; []);

  environment.systemPackages = with pkgs; [
    celluloid
    gnome-tweaks
    fragments
    gnome-extension-manager
    foliate
    rnote
    drawing
    amberol
    parabolic
    gnome-network-displays

    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
  ];

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
}
