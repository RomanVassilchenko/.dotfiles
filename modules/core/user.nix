{ pkgs, inputs, username, host, ...}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    backupFileExtension = "hm-backup";
    users.${username} = {
      imports = 
        if (host == "desktop") then 
          [ ./../home/default.desktop.nix ] 
        elseif (host == "mbp-rovasilchenko-OZON-W0HDJTC2M5") then
          [ ./../home/default.darwin.nix ]
        else [ ./../home ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = [ "${username}" ];
}
