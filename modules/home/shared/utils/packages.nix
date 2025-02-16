{ pkgs, ... }:

let
  dev = with pkgs; [
    cloudflared
    docker
    docker-compose
    gcc
    gnumake
    goose
    imagemagick
    jq
    kubectl
    lazydocker
    lazygit
    nix-info
    nixd
    nixfmt-rfc-style
    nixpkgs-fmt
    protobuf
    python3
    python312Packages.googleapis-common-protos
    python312Packages.ipython
  ];

  cli = with pkgs; [
    aerc
    cachix
    colima
    eza
    fd
    ffmpeg
    file
    gtrash
    just
    killall
    less
    lsof
    man-pages
    nano
    nil
    onefetch
    openssl
    ripgrep
    sd
    tldr
    tmate
    todo
    toipe
    tree
    ttyper
    unzip
    wget
    xdg-ninja
    xdg-utils
    yazi
    yt-dlp-light
  ];
in
{
  home.packages = dev ++ cli;
}
