{
  imports = [
    ../shared
    ./gaming.nix
    ./packages.nix
    ./obs.nix
    ../shared/utilities.nix
    ../shared/gui.nix
    ./plasma.nix
  ];

  programs.zsh.enable = true;
}
