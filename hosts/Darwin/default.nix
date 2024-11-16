{
  pkgs,
  lib,
  khanelivim,
  ...
}:
{
  imports = [
    ./../../modules/core
    ./../../modules/darwin
  ];

  environment.systemPackages = with pkgs; [
    khanelivim.packages.${system}.default
  ];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";
}
