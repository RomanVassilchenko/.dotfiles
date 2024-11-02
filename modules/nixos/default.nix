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
    ./bootloader.nix
    ./flatpak.nix
    ./hardware.nix
    ./network.nix
    ./packages.nix
    ./pipewire.nix
    ./plasma.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./user.nix
    # ./wayland.nix
    ./virtualization.nix
    ./xserver.nix
  ];
}
