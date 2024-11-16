{
  pkgs,
  inputs,
  khanelivim,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    ./../../modules/nixos
  ];

  environment.systemPackages = with pkgs; [
    khanelivim.packages.${system}.default
    inputs.zen-browser.packages."${system}".specific
    v4l-utils
  ];
}
