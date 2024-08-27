{ config, pkgs, ... }:

{
  services.printing.enable = true;
  services.libinput.enable = true;
  services.openssh.enable = true;
  services.flatpak.enable = true;
  services.auto-epp.enable = true;
}
