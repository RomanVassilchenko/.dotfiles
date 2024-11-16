{ inputs, pkgs, ... }:
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
      go
      goose
      gnumake
      gtrash
      inkscape
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

      ## CLI
      # cbonsai # terminal screensaver
      # cmatrix

      ## GUI Apps
      jetbrains.datagrip
      jetbrains.goland
      gimp
      inkscape
      obsidian
      postman
      zed

      # C / C++
      # gcc
      gnumake

      # Python
      python3
      # python312Packages.ipython

    ]
  );
}
