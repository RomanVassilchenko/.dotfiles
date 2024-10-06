{ config, pkgs, lib, ... }:

{
  home.username = "rovasilchenko";

  # home.sessionVariables.ZDOTDIR = "${config.home.homeDirectory}/.config/zsh";

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
      # path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git" 
        "sudo" 
        "fzf" 
        "docker" 
        "docker-compose"
        "zoxide"
      ];
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

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      LazyVim
    ];
  };

  home.packages = with pkgs; [
    fzf
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-you-should-use
  ];

  home.stateVersion = "24.05";
}
