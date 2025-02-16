{
  username,
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.nix-index.enable = true;

  home.activation.developer = ''
    mkdir -p ~/Development
  '';

  programs.home-manager.enable = true;

  home.sessionVariables = lib.mkMerge [
    {
      PROJECTS = "$HOME/Development";
      XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
      XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
      XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
      XDG_RUNTIME_DIR = "/run/user/$(id -u)";
      GOPATH = "${config.home.homeDirectory}/.local/share/go";
      DOCKER_CONFIG = "${config.home.homeDirectory}/.config/docker";
      MINIKUBE_HOME = "${config.home.homeDirectory}/.local/share/minikube";

      PATH = lib.mkAfter "${config.home.homeDirectory}/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:/etc/profiles/per-user/${username}/bin:/opt/homebrew/bin:/run/current-system/sw/bin:${config.home.homeDirectory}/.o3-cli/bin:${pkgs.coreutils}/bin:/bin:/usr/bin:/usr/local/go/bin:/usr/local/bin:/sbin:${config.home.sessionVariables.GOPATH}/bin:/Users/rovasilchenko/Library/Application Support/JetBrains/Toolbox/scripts";
    }
  ];
}
