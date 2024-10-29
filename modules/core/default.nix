{
  inputs,
  nixpkgs,
  self,
  username,
  host,
  ...
}:
{
  imports = [
    ./network.nix
    ./packages.nix
    ./program.nix
    ./system.nix
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
