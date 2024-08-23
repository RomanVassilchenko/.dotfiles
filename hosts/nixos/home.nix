{ config, pkgs, ... }:

{
  home.username = "rovasilchenko";
  home.homeDirectory = "/home/rovasilchenko";

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = ["git" "zsh-syntax-highlighting" "zsh-autosuggestions"];
      theme = "agnoster";
    };
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      lah = "ls -lah";
      up = "nh os switch ~/.dotfiles/nix";
    };
  };

  programs.git = {
    enable = true;
    userName = "Roman Vassilchenko";
    userEmail = "roman.vassilchenko.work@gmail.com";
    extraConfig = ''
      [alias]
          co = checkout
          br = branch
          ci = commit
          st = status
          hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
    '';
  };

  home.packages = with pkgs; [
    bat
    fd
    ripgrep
    zsh
  ];

  home.stateVersion = "24.05";  # Use the same version as your system.stateVersion
}
