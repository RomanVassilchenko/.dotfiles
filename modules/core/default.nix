{
  inputs,
  ...
}:
{
  imports = [
    # ./nh.nix
    ./network.nix
    ./program.nix
    ./system.nix
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
