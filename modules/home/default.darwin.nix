{
  inputs,
  username,
  host,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./bat.nix
    ./btop.nix
    ./common-packages.nix
    ./darwin-packages.nix
    ./discord.nix
    ./fastfetch.nix
    ./fzf.nix
    ./git.nix
    ./kitty.nix
    ./micro.nix
    ./nvchad.nix
    ./p10k/p10k.nix
    ./starship.nix
    ./tmux.nix
    ./vscode.nix
    ./zellij.nix
    ./zsh
  ];

  programs.git = {
    userName = lib.mkForce "rovasilchenko";
    userEmail = lib.mkForce "rovasilchenko@ozon.ru";
    extraConfig.init.defaultBranch = lib.mkForce "master";
  };

  programs.home-manager.enable = true;

  # Define PATH and session variables
  home.sessionVariables = lib.mkMerge [
    {
      # Define XDG and Go paths
      XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
      XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
      XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
      XDG_RUNTIME_DIR = "/run/user/$(id -u)";
      GOPATH = "${config.home.homeDirectory}/.local/share/go";

      PATH = lib.mkAfter "${config.home.homeDirectory}/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:/etc/profiles/per-user/${username}/bin:/opt/homebrew/bin:/run/current-system/sw/bin:${config.home.homeDirectory}/.o3-cli/bin:${pkgs.coreutils}/bin:/bin:/usr/bin:/usr/local/go/bin:/usr/local/bin:/sbin:${config.home.sessionVariables.GOPATH}/bin";
    }
  ];
}
