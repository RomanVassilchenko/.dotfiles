{ config, pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.kate
    kdePackages.merkuro
    kdePackages.kmail
    kdePackages.skanpage
    kdePackages.filelight
    kdePackages.kdeconnect-kde
    kdePackages.plasma-browser-integration
    kdePackages.kolourpaint
    kdePackages.kpat
    kdePackages.kcalc
    haruna
    # kdePackages.kamoso
  ];
}
