{ config, pkgs, inputs, ... }:

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

  users.defaultUserShell=pkgs.zsh;
  users.users.rovasilchenko = {
    isNormalUser = true;
    description = "Roman Vassilchenko";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestions.enable     = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    ll = "ls -l";
    la = "ls -a";
    lah = "ls -lah";
    up = "nh os switch ~/.dotfiles/nix";
  };

};

  nixpkgs.config.allowUnfree = true;

  environment.etc."gitconfig".text = ''
    [user]
        name = Roman Vassilchenko
        email = roman.vassilchenko.work@gmail.com

    [alias]
        co = checkout
        br = branch
        ci = commit
        st = status
        hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
  '';

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/rovasilchenko/.dotfiles/nix";
  };

  system.stateVersion = "24.05";
}
