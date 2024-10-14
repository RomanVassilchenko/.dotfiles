{ pkgs, lib, ... }:

let
  commonPackages = with pkgs; [
    # alacritty
    kitty
    ffmpeg
    git
    gnupg
    neovim
    obsidian
    ripgrep
    fzf
    tmux
    zoxide
    btop
    eza
    fastfetch
    stow
    tree
    bat
    gimp
    inkscape
    telegram-desktop
    discord
    postman
    vscode
    zed
    go
    docker
    docker-compose
    kubectl
    zellij
    goose
    nixfmt-rfc-style
  ];
in
{
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    inter
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = commonPackages;
}
