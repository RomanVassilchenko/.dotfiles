{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [ ../shared/home.nix ];

  home.homeDirectory = lib.mkForce "/Users/rovasilchenko";

  home.sessionVariables = lib.mkMerge [
    {
      XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
      XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
      XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
      XDG_RUNTIME_DIR = "/run/user/$(id -u)";

      GOPATH = "${config.home.homeDirectory}/.local/share/go";
      LESSHISTFILE = "${config.home.homeDirectory}/.local/state/less/history";
      ZPLUG_HOME = "${config.home.homeDirectory}/.local/share/zplug";
      # HISTFILE = "${config.home.homeDirectory}/.local/state/zsh/history";
      # ZDOTDIR = "${config.home.homeDirectory}/.config/zsh";
      PATH = lib.mkAfter "/run/current-system/sw/bin:${config.home.homeDirectory}/.o3-cli/bin:${pkgs.coreutils}/bin:/bin:/usr/bin:/usr/local/go/bin:/usr/local/bin:/sbin:${config.home.sessionVariables.GOPATH}/bin:/opt/homebrew/bin";
    }
  ];

  programs.zsh.shellAliases.up = "darwin-rebuild switch --flake ~/.dotfiles#mbp-rovasilchenko-OZON-W0HDJTC2M5";

  programs.git.userName = "rovasilchenko";
  programs.git.userEmail = "rovasilchenko@ozon.ru";

  home.packages = with pkgs; [ ];
}
