{ config, pkgs, lib, ... }:

let
  isNixOS = lib.mkIf (config ? systemd) "linux";
  platform = if isNixOS == "linux" then "linux" else "darwin";
in

{
  home.username = "rovasilchenko";
  home.homeDirectory = lib.mkForce (if platform == "darwin" then "/Users/rovasilchenko" else "/home/rovasilchenko");

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      lah = "ls -lah";
      v = "nvim";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "agnoster";
    };
  };

  programs.git = {
    enable = true;
    extraConfig = {
      alias = {
        co = "checkout";
        br = "branch";
        ci = "commit";
        st = "status";
        hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
      };
      push = { autoSetupRemote = true; };
    };
  };

  # programs.neovim = {
  #   enable = true;
  #   viAlias = true;
  #   vimAlias = true;
  #   defaultEditor = true;
  #   plugins = with pkgs.vimPlugins; [
  #     yuck-vim
  #     scss-syntax-vim
  #     nerdtree
  #   ];
  #   extraConfig = ''
  #     :set number relativenumber
  #     :set tabstop=2
  #     :set shiftwidth=2
  #     :set expandtab
  #     :set autoindent
  #     :syntax on
  #   '';
  # };

  home.packages = with pkgs; [
    vimPlugins.LazyVim
  ];

  home.stateVersion = "24.05";
}
