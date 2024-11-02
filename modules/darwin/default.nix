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
    ./brew.nix
    ./packages.nix
    ./system.nix
    ./user.nix
    inputs.nh_darwin.nixDarwinModules.prebuiltin
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    inter
  ];

  nixpkgs.config.allowUnfree = true;

  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;
}
