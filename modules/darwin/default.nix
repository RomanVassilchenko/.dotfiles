{
  pkgs,
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
}
