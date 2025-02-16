{
  pkgs,
  lib,
  inputs,
  host,
  ...
}:
{
  imports = [
    ./brew.nix
    ./system.nix
    ./user.nix
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nixpkgs.config.allowUnfree = true;

  nix.enable = true;

  security.pam.enableSudoTouchIdAuth = true;

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  networking = {
    hostName = "${host}";
  };

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";

  programs.zsh.enable = true;

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    # optimise.automatic = true; # Turn on after fix of https://github.com/NixOS/nix/issues/7273/
  };
  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  time.timeZone = "Asia/Almaty";
}
