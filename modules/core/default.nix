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
    ./program.nix
    ./system.nix
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
