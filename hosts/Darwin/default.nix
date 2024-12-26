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

  services.nix-daemon.enable = true;

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

  # programs.nh =
  #   {
  #     enable = true;
  #     clean = {
  #       enable = true;
  #       extraArgs = "--keep-since 7d --keep 5";
  #     };
  #   }
  #   // lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
  #     flake = "/home/${username}/.dotfiles";
  #   };

  # environment.systemPackages = with pkgs; [
  #   nix-output-monitor
  #   nvd
  # ];
}
