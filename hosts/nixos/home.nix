{ config, pkgs, ... }:

{
  imports = [
    ../shared/home.nix
  ];

  programs.zsh.shellAliases.up = "nh os switch ~/.dotfiles";

  programs.git.userName = "Roman Vassilchenko";
  programs.git.userEmail = "roman.vassilchenko.work@gmail.com";

  home.packages = with pkgs; [
    zsh
  ];

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "Default";
      theme_background = false;
    };
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
        obs-backgroundremoval
    ];
  };

  home.stateVersion = "24.05";  # Use the same version as your system.stateVersion
}
