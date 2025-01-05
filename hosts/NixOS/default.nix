{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ./gaming.nix
  ];

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    v4l-utils
  ];
}
