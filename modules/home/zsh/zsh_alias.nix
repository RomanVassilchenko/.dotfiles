{
  hostname,
  config,
  pkgs,
  host,
  ...
}:
{
  programs.zsh = {
    shellAliases = {
      # Utils
      c = "clear";
      cd = "z";
      tt = "gtrash put";
      cat = "bat";
      nano = "micro";
      code = "code";
      diff = "delta --diff-so-fancy --side-by-side";
      less = "bat";
      y = "yazi";
      py = "python";
      ipy = "ipython";
      icat = "kitten icat";
      dsize = "du -hs";
      pdf = "tdf";
      open = "xdg-open";
      space = "ncdu";
      man = "BAT_THEME='default' batman";

      l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Nixos
      cdnix = "cd ~/.dotfiles && code ~/.dotfiles";
      ns = "nom-shell --run zsh";
      nix-switch = "nh os switch ~/.dotfiles";
      nix-update = "nh os switch --update ~/.dotfiles";
      nix-clean = "nh clean all --keep 5 ~/.dotfiles";
      nix-search = "nh search";
      nix-test = "nh os test ~/.dotfiles";

      # darwin
      up = "darwin-rebuild switch --flake ~/.dotfiles#mbp-rovasilchenko-OZON-W0HDJTC2M5";

      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";
    };
  };
}
