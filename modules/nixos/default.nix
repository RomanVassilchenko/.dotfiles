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
    # ./wayland.nix
    #./virtualization.nix
    #./xserver.nix

    ./gnome.nix

    #./plasma.nix

    ./bootloader.nix
    ./flatpak.nix
    ./hardware.nix
    ./network.nix
    ./packages.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./user.nix
  ];
}
