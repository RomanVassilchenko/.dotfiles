{
  pkgs,
  inputs,
  host,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.home-manager.nixosModules.home-manager
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  networking = {
    hostName = "${host}";
  };

  programs.zsh.enable = true;

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
      # "io.github.zen_browser.zen"
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

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
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
  # environment.variables = {
  #   XDG_SESSION_TYPE = "wayland";
  #   QT_QPA_PLATFORM = "wayland";
  #   GDK_BACKEND = "wayland";
  #   MOZ_ENABLE_WAYLAND = "1";
  # };

  # Optional compositor settings for smoother experience on Wayland
  # services.xserver.windowManager.compton = {
  #   enable = true;
  #   shadow = true;
  #   shadowOpacity = 0.7;
  #   shadowRadius = 12;
  # };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };

  # Enable CUPS to print documents.
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rovasilchenko = {
    isNormalUser = true;
    description = "Roman Vassilchenko";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      kdePackages.kate
      #  thunderbird
    ];
  };

  # Install firefox.
  #   programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    v4l-utils
    wget
    git

    haruna
    kdePackages.merkuro
    kdePackages.kmail
    kdePackages.kmail-account-wizard
    kdePackages.kdepim-addons
    papirus-icon-theme
    gnome-disk-utility
    # pkgs.elisa
    # kdeApplications.dolphin # File manager
    # kdeApplications.konsole # Terminal emulator
    # kdeApplications.kate # Text editor
    # kdeApplications.okular # PDF viewer
    # kdeApplications.ark # Archive manager
    # kdeApplications.kdeconnect # Phone integration
    # kdeApplications.spectacle # Screenshot tool
    # plasma5.breeze # Breeze theme
    # plasma5.kdeplasma-addons # Additional widgets and addons
  ];
}
