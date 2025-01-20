{
  pkgs,
  inputs,
  username,
  ...
}:
{
  imports = [ inputs.home-manager.darwinModules.home-manager ];

  users.users.${username} = {
    shell = pkgs.zsh;
  };
  nix = {
    settings = {
      allowed-users = [ "${username}" ];
      use-xdg-base-directories = true;
    };
  };
}
