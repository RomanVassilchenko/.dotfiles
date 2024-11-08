{
  pkgs,
  inputs,
  username,
  host,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    sharedModules = [
      # inputs.plasma-manager.homeManagerModules.plasma-manager
    ];
    extraSpecialArgs = {
      inherit inputs username host;
    };
    backupFileExtension = "hm-backup";

    users.${username} = {
      imports = [ ./../home ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.11";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "tss"
    ];
    shell = pkgs.zsh;
  };

  nix.settings.allowed-users = [ "${username}" ];

  # Needed for direnv + nix-shell
  # to prevent invalidating caches.
  nix.settings = {
    keep-outputs = true;
    keep-derivations = true;
  };

  # Autoupdating
  system.autoUpgrade.enable = false;
  system.autoUpgrade.allowReboot = false;
}
