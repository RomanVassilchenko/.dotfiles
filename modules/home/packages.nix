{ inputs, pkgs, lib, system, ... }:
let
# _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {};
  commonPackages = with pkgs; [
      ## CLI utility
      eza # ls replacement
      fd # find replacement
      ffmpeg
      file # Show file information
      jq # JSON processor
      lazydocker
      lazygit
      man-pages # extra man pages
      nixd
      nixfmt-rfc-style
      onefetch # fetch utility for git repo
      ripgrep # grep replacement
      tldr
      tree
      unzip
      wget
      zip

      ## GUI Apps
      gimp
      inkscape
      obsidian
      postman
      telegram-desktop
      zed

      # C / C++
      gcc
      gnumake

      # Python
      python3
      python312Packages.ipython
  ];

  linuxPackages = if pkgs.stdenv.hostPlatform.isLinux then with pkgs; [
      # _2048

      ## CLI utility
      ani-cli
      binsider
      bitwise # cli tool for bit / hex manipulation
      caligula # User-friendly, lightweight TUI for disk imaging
      dconf-editor
      docfd # TUI multiline fuzzy document finder
      entr # perform action when file change
      gtt # google translate TUI
      gifsicle # gif utility
      gtrash # rm replacement, put deleted files in system trash
      hexdump
      imv # image viewer
      killall
      libnotify
      mimeo
      mpv # video player
      ncdu # disk space
      nitch # systhem fetch util
      openssl
      pamixer # pulseaudio command line mixer
      playerctl # controller for media players
      poweralertd
      programmer-calculator
      swappy # snapshot editing tool
      tdf # cli pdf viewer
      todo # cli todo list
      toipe # typing test in the terminal
      ttyper # cli typing test
      valgrind # c memory analyzer
      wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
      yazi # terminal file manager
      yt-dlp-light
      xdg-utils
      xxd

      ## CLI
      cbonsai # terminal screensaver
      cmatrix
      pipes # terminal screensaver
      sl
      tty-clock # cli clock

      # C / C++
      gdb

      ## GUI Apps
      audacity
      bitwarden-desktop
      bleachbit # cache cleaner
      dbeaver-bin
      gimp
      gnome-boxes
      gnumake
      inkscape
      kdePackages.kdenlive
      krita
      libreoffice
      nix-prefetch-github
      obs-studio
      pavucontrol # pulseaudio volume controle (GUI)
      pitivi # video editing
      qalculate-gtk # calculator
      soundwireserver
      telegram-desktop
      thunderbird
      vlc
      winetricks
      wineWowPackages.wayland
      zenity

      inputs.alejandra.defaultPackage.${system}
  ] else [];


  macosPackages = if pkgs.stdenv.hostPlatform.isDarwin then with pkgs; [
    docker
    docker-compose
    goose
    kubectl
    mkalias
    # mas
    zellij
  ] else [];

in
{
  home.packages = commonPackages ++ linuxPackages ++ macosPackages;
}
