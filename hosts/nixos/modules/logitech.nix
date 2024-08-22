{ config, pkgs, ... }:

{
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
  environment.systemPackages = with pkgs; [solaar];
}
