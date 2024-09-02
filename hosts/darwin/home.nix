# hosts/darwin/home.nix
{ config, pkgs, lib, ... }:

{
  imports = [
    ../shared/home.nix
  ];

  home.homeDirectory = lib.mkForce "/Users/rovasilchenko";

  programs.zsh.shellAliases.up = "darwin-rebuild switch --flake ~/.dotfiles#mbp-rovasilchenko-OZON-W0HDJTC2M5";

  programs.git.userName = "rovasilchenko";
  programs.git.userEmail = "rovasilchenko@ozon.ru";

  home.packages = with pkgs; [
    # wget
    # curl
    # fzf
    # zoxide
    # bat
    # fd
    # ripgrep
    # neovim
  ];

  home.stateVersion = "24.05";
}
