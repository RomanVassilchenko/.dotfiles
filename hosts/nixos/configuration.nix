{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/localization.nix
    ./modules/audio.nix
    ./modules/services.nix
    ./modules/fonts.nix
    ./modules/logitech.nix
    ./modules/games.nix
    ./modules/applications.nix

    # ./desktop/plasma.nix
    ./desktop/gnome.nix
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  users.users.rovasilchenko = {
    isNormalUser = true;
    description = "Roman Vassilchenko";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/rovasilchenko/.dotfiles/nix";
  };

  system.stateVersion = "24.05";
}
