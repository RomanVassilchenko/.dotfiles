{ pkgs, ... }:

{
  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      inter
      sketchybar-app-font
    ];
  };

  environment.systemPackages = with pkgs; [
    alacritty
    kitty
    ffmpeg
    git
    gnupg
    mkalias
    neovim
    nil
    obsidian
    ripgrep
    fzf
    tmux
    nixfmt-rfc-style
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
    lima
    colima
    docker
    docker-compose
    docker-credential-helpers
    grpc
    golangci-lint
    vault
    kubectl
    kubectx
    xdg-ninja
    protobuf
    tree-sitter
    unzip
    wget
    pandoc
    goose
    buf
    curl

    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-you-should-use
  ];
}
