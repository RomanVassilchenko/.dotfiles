{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      kdePackages.kate
      haruna
      kdePackages.merkuro
      kdePackages.kmail
      kdePackages.kmail-account-wizard
      kdePackages.kdepim-addons
      kdePackages.kdeconnect-kde
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
      # plasma5.kdeplasma-addons # Additional widgets and addons]
    ]
  );
}
