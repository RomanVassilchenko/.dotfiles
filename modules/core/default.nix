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
    ./nh.nix
    ./network.nix
    ./packages.nix
    ./program.nix
    ./system.nix
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
