{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./brew.nix
    ./system.nix
    ./user.nix
    inputs.nh_darwin.nixDarwinModules.prebuiltin
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  nixpkgs.config.allowUnfree = true;

  services.nix-daemon.enable = true;

  security.pam.enableSudoTouchIdAuth = true;
}
