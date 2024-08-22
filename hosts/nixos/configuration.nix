{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
  ];

  networking.networkmanager.enable = true;

  networking.hostName = "XiaoXinPro";
  time.timeZone = "Asia/Almaty";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.wayland.enable = true;


  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.printing.enable = true;

  services.libinput.enable = true;

  users.users.rovasilchenko = {
    isNormalUser = true;
    description = "Roman Vassilchenko";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestions.enable     = true;
  syntaxHighlighting.enable = true;

#   zplug = {
#     enable = true;
#     plugins = [
#       { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
#       { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
#     ];
#   };

  shellAliases = {
    ll = "ls -l";
    la = "ls -a";
    lah = "ls -lah";
    up = "nh os switch ~/.dotfiles/nix";
  };

#   history = {
#     size = 10000;
#     path = "${config.xdg.dataHome}/zsh/history";
#   };

};

# networking.firewall = {
#     enable = true;
#     allowedTCPPortRanges = [
#       { from = 1714; to = 1764; } # KDE Connect
#     ];
#     allowedUDPPortRanges = [
#       { from = 1714; to = 1764; } # KDE Connect
#     ];
#   };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    kdePackages.kate
    google-chrome
    vesktop
    bottles
    telegram-desktop
    spotify
    vscode
    heroic
    cartridges
    lutris
    obs-studio
    gimp-with-plugins
    libreoffice-qt6-fresh
    thunderbird
    prismlauncher
    krita
    goldwarden
    kdePackages.kdenlive
    ryujinx
    gnome.gnome-boxes
    inkscape-with-extensions
    postman
    dbeaver-bin
    haruna
    papirus-icon-theme
    kdePackages.merkuro
    kdePackages.kmail
#     jetbrains.goland
    fastfetch
    kdePackages.skanpage
    kdePackages.filelight
    osu-lazer
    solaar
    kdePackages.kpat
    itch
    kdePackages.kcalc
    neovim
    adwsteamgtk
    kdePackages.kolourpaint
    insync
    kdePackages.kdeconnect-kde
      kdePackages.plasma-browser-integration
#     kdePackages.kamoso
  ];

  environment.etc."gitconfig".text = ''
    [user]
        name = Roman Vassilchenko
        email = roman.vassilchenko.work@gmail.com

    [alias]
        co = checkout
        br = branch
        ci = commit
        st = status
        hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
  '';



   hardware.logitech.wireless.enable = true;
   hardware.logitech.wireless.enableGraphical = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    inter
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/rovasilchenko/.dotfiles/nix";
  };


  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession.enable = true;
  };

  services.openssh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.05";
}
