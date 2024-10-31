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

  users.users.${username} = {
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = [ "${username}" ];
}
