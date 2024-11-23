{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./../../modules/core
    ./../../modules/darwin
  ];

  environment.systemPackages = with pkgs; [ ];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";
}
