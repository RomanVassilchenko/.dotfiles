{ config, pkgs, ... }:

{
  # Enable Hyprland as the Wayland compositor and desktop environment
  services.wm.hyprland.enable = true;

  # Set environment packages
  environment.systemPackages = with pkgs; [
    hyprland
    waybar # Highly customizable status bar for Wayland
    alacritty # Terminal emulator
    dmenu # Application launcher
    wl-clipboard # Clipboard for Wayland
    grim # Screenshot utility for Wayland
    slurp # Select area for grim screenshots
    wf-recorder # Screen recording tool
    kdeconnect # KDE Connect for phone integration
    haruna # Video player (you used this in your plasma config)
    # Additional utilities
    mako # Wayland notification daemon
    xdg-desktop-portal
    xdg-desktop-portal-wlr
  ];

  # Optional: Add support for xwayland if needed for compatibility with X11 apps
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
    libinput.enable = true;
  };

  # Enable xdg portal
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  # Optional: Hyprland specific configuration
  programs.hyprland = {
    useDefaultConfig = true; # Set to false if you want to customize
    configFile = ./hyprland.conf; # Point to your custom Hyprland config if needed
  };
}
