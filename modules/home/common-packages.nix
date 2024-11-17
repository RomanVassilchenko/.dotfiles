{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      docker
      docker-compose
      eza
      fd
      ffmpeg
      file
      gcc
      gimp
      goose
      gnumake
      gtrash
      inkscape
      # jetbrains.datagrip
      # jetbrains.goland
      jq
      killall
      kubectl
      lazydocker
      lazygit
      man-pages
      nano
      # ncdu
      nixd
      nixfmt-rfc-style
      obsidian
      onefetch
      openssl
      postman
      programmer-calculator
      protobuf
      python3
      python312Packages.ipython
      python312Packages.googleapis-common-protos
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
