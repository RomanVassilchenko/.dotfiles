{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot = {
    configurationLimit = 3;
    consoleMode = "max";
  };

  boot.loader.timeout = 3;
}
