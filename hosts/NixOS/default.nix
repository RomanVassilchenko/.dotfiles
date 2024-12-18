{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    ./../../modules/nixos/default.xiaoxinpro.nix
  ];

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${system}".specific
    v4l-utils
  ];
}
