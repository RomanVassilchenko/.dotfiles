{
  inputs,
  username,
  host,
  lib,
  ...
}:
{
  imports = [
    ./bat.nix # better cat command
    ./btop.nix # resouces monitor
    ./fastfetch.nix # fetch tool
    ./fzf.nix # fuzzy finder
    ./git.nix # version control
    ./kitty.nix # terminal
    ./micro.nix # nano replacement
    ./nvim.nix # neovim editor
    ./p10k/p10k.nix
    ./common-packages.nix # other packages
    ./darwin-packages.nix # other packages
    ./starship.nix # shell prompt
    # ./vscode.nix # vscode forck
    # ./wezterm.nix # terminal
    ./zsh # shell
  ];

  programs.git = {
    userName = lib.mkForce "rovasilchenko";
    userEmail = lib.mkForce "rovasilchenko@ozon.ru";
    extraConfig.init.defaultBranch = lib.mkForce "master";
  };
}
