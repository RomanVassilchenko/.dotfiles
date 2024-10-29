{
  self,
  pkgs,
  lib,
  inputs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
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
    hexdump
    imv # image viewer
    killall
    mpv # video player
    nitch # systhem fetch util
    pamixer # pulseaudio command line mixer
    playerctl # controller for media players
    poweralertd
    swappy # snapshot editing tool
    tdf # cli pdf viewer
    valgrind # c memory analyzer
    wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
    xxd

    ## CLI
    pipes # terminal screensaver
    sl
    tty-clock # cli clock

    ## GUI Apps
    audacity
    bleachbit # cache cleaner
    libreoffice
    nix-prefetch-github
    obs-studio
    pavucontrol # pulseaudio volume controle (GUI)
    pitivi # video editing
    qalculate-gtk # calculator
    soundwireserver
    thunderbird
    vlc
    winetricks
    wineWowPackages.wayland
    zenity

    # C / C++
    gdb

    inputs.alejandra.defaultPackage.${system}
  ];
}
