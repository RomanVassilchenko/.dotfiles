{
  pkgs,
  inputs,
  username,
  host,
  lib,
  ...
}:
{
  imports = [ inputs.home-manager.darwinModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs username host;
    };
    users.${username} = {
      imports = [ ./../home/default.darwin.nix ];
      home.username = "${username}";
      home.homeDirectory = lib.mkForce "/Users/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    # isNormalUser = true;
    # description = "${username}";
    # extraGroups = [
    #   "networkmanager"
    #   "wheel"
    # ];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = [ "${username}" ];
}
