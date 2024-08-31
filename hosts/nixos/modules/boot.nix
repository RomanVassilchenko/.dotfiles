{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot = {
    # We use Git for version control, so we don't need to keep too many generations.
    configurationLimit = 10;  # Set directly to 10
    # Pick the highest resolution for systemd-boot's console.
    consoleMode = "max";  # Set directly to "max"
  };

  boot.loader.timeout = 3;  # Set directly to 3 seconds
}
