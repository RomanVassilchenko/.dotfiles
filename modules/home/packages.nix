{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      colima
      docker
      docker-compose
      eza
      fd
      ffmpeg
      file
      gcc
      gimp
      gnumake
      go
      goose
      gnumake
      gtrash
      inkscape
      jetbrains.datagrip
      jetbrains.goland
      jq
      killall
      kubectl
      lazydocker
      lazygit
      lsof
      man-pages
      nano
      nixd
      nixfmt-rfc-style
      obsidian
      onefetch
      openssl
      postman
      programmer-calculator
      protobuf
      python3
      python312Packages.googleapis-common-protos
      python312Packages.ipython
      ripgrep
      tldr
      todo
      toipe
      ttyper
      unzip
      wget
      xdg-utils
      yazi
      yt-dlp-light
      zed
    ]
  );
}
