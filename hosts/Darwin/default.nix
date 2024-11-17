{
  lib,
  ...
}:
{
  imports = [
    ./../../modules/core
    ./../../modules/darwin
  ];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";
}
