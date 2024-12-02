{ config, pkgs, ... }:

{
  services = {
    xserver.enable = true;
    displayManager = {
      defaultSession = "plasma";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    # plasma-browser-integration
    konsole
    oxygen
  ];

  qt = {
    enable = true;
    # platformTheme = "gnome";
    # style = "adwaita-dark";
  };

  #   xdg.configFile = {
  #   "Kvantum/ArcDark".source = "${pkgs.arc-kde-theme}/share/Kvantum/ArcDark";
  #   "Kvantum/kvantum.kvconfig".text = "[General]\ntheme=ArcDark";
  # };

  # System packages, including KDE applications
  environment.systemPackages = with pkgs; [
    haruna
    kdePackages.merkuro
    kdePackages.kmail
    kdePackages.kmail-account-wizard
    kdePackages.kdepim-addons
    papirus-icon-theme
    gnome-disk-utility
    # pkgs.elisa
    # kdeApplications.dolphin # File manager
    # kdeApplications.konsole # Terminal emulator
    # kdeApplications.kate # Text editor
    # kdeApplications.okular # PDF viewer
    # kdeApplications.ark # Archive manager
    # kdeApplications.kdeconnect # Phone integration
    # kdeApplications.spectacle # Screenshot tool
    # plasma5.breeze # Breeze theme
    # plasma5.kdeplasma-addons # Additional widgets and addons
  ];

  # Enable basic services
  services.dbus.enable = true;
  networking.networkmanager.enable = true;
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  # Set theme and font options (optional)
  # fonts.fonts = with pkgs; [
  #   noto-fonts
  #   noto-fonts-cjk
  #   noto-fonts-emoji
  # ];
  # environment.variables = {
  #   XDG_SESSION_TYPE = "wayland";
  #   QT_QPA_PLATFORM = "wayland";
  #   GDK_BACKEND = "wayland";
  #   MOZ_ENABLE_WAYLAND = "1";
  # };

  # Optional compositor settings for smoother experience on Wayland
  # services.xserver.windowManager.compton = {
  #   enable = true;
  #   shadow = true;
  #   shadowOpacity = 0.7;
  #   shadowRadius = 12;
  # };
}
