{
  inputs,
  nixpkgs,
  pkgs,
  config,
  self,
  username,
  host,
  ...
}:
{
  imports = [
    ./user.nix
    ./system.nix
    ./brew.nix
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    inter
  ];

  nixpkgs.config.allowUnfree = true;

  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;
}
