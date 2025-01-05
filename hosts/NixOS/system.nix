{
  pkgs,
  inputs,
  host,
  ...
}:
{
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  networking = {
    hostName = "${host}";
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    # optimise.automatic = true; # Turn on after fix of https://github.com/NixOS/nix/issues/7273/
  };
  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
  };

  hardware = {
    graphics = {
      enable = true;
    };
  };
  hardware.enableRedistributableFirmware = true;

  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  services.flatpak = {
    enable = true;
    packages = [
      "com.github.tchx84.Flatseal"
    ];
    overrides = {
      global = {
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];
      };
    };
  };

  time.timeZone = "Asia/Almaty";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager.enable = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
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
  };

  services = {
    xserver.enable = true;
    displayManager = {
      defaultSession = "plasma";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };

  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    # plasma-browser-integration
    konsole
    oxygen
  ];

  qt = {
    enable = true;
    # platformTheme = "gnome";
    # style = "adwaita-dark";
  };

  #   xdg.configFile = {
  #   "Kvantum/ArcDark".source = "${pkgs.arc-kde-theme}/share/Kvantum/ArcDark";
  #   "Kvantum/kvantum.kvconfig".text = "[General]\ntheme=ArcDark";
  # };

  # Enable basic services
  services.dbus.enable = true;
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  # Set theme and font options (optional)
  # fonts.fonts = with pkgs; [
  #   noto-fonts
  #   noto-fonts-cjk
  #   noto-fonts-emoji
  # ];
  environment.variables = {
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
  };

  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };

  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rovasilchenko = {
    isNormalUser = true;
    description = "Roman Vassilchenko";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "25.05";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
