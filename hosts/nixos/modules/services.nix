{ config, pkgs, ... }:

{
  services.printing.enable = true;
  services.libinput.enable = true;
  services.openssh.enable = true;
}
