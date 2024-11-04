{
  inputs,
  username,
  host,
  ...
}:
{
  imports = [
    ./bat.nix # better cat command
    ./btop.nix # resouces monitor
    ./discord/discord.nix # discord with gruvbox
    ./fastfetch.nix # fetch tool
    ./fzf.nix # fuzzy finder
    ./gaming.nix # packages related to gaming
    ./git.nix # version control
    ./gnome.nix # gnome apps
    ./gtk.nix # gtk theme
    # ./hyprland # window manager
    ./kitty.nix # terminal
    ./micro.nix # nano replacement
    ./nvim.nix # neovim editor
    ./p10k/p10k.nix
    ./plasma.nix
    ./common-packages.nix # other packages
    ./nix-packages.nix # other packages
    ./starship.nix # shell prompt
    ./vscode.nix # vscode forck
    ./zellij.nix
    ./zsh # shell
  ];
}
