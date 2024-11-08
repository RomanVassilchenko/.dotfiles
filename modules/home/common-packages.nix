{ inputs, pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      docker
      docker-compose
      eza # ls replacement
      fd # find replacement
      ffmpeg
      file # Show file information
      goose
      # gtrash # rm replacement, put deleted files in system trash
      jq # JSON processor
      killall
      kubectl
      lazydocker
      lazygit
      # libnotify
      man-pages # extra man pages
      # mimeo
      nano
      # ncdu # disk space
      nixd
      nixfmt-rfc-style
      obsidian
      openssl
      onefetch # fetch utility for git repo
      # programmer-calculator
      ripgrep # grep replacement
      tldr
      # todo # cli todo list
      # toipe # typing test in the terminal
      # ttyper # cli typing test
      unzip
      wget
      # yazi # terminal file manager
      # yt-dlp-light
      xdg-utils
      # zellij
      zoxide

      ## CLI
      # cbonsai # terminal screensaver
      # cmatrix

      ## GUI Apps
      gimp
      inkscape
      obsidian
      postman
      zed

      # C / C++
      # gcc
      gnumake

      # Go
      go

      # Python
      python3
      # python312Packages.ipython

    ]
  );
}
