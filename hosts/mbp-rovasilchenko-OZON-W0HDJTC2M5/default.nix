{ pkgs, inputs, ... }:
{
  imports = [
    ./../../modules/darwin
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
