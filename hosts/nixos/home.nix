{ config, pkgs, ... }:

{
  home.username = "rovasilchenko";
  home.homeDirectory = "/home/rovasilchenko";

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
      up = "nh os switch ~/.dotfiles";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "agnoster"; # blinks is also really nice
    };
  };

  programs.git = {
    enable = true;
    userName = "Roman Vassilchenko";
    userEmail = "roman.vassilchenko.work@gmail.com";
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

  home.packages = with pkgs; [
    zsh
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      yuck-vim
      scss-syntax-vim
      nerdtree
    ];
    extraConfig = ''
      :set number relativenumber
      :set tabstop=2
      :set shiftwidth=2
      :set expandtab
      :set autoindent
      :syntax on
    '';
  };

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "Default";
      theme_background = false;
    };
  };

  home.stateVersion = "24.05";  # Use the same version as your system.stateVersion
}
