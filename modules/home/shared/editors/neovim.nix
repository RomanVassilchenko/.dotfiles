{ config, lib, ... }:
{
  programs.neovim.enable = true;

  home.activation.symlinkNvim = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ln -sf ~/.dotfiles/modules/home/shared/editors/nvim "$HOME/.config/nvim"
  '';
}
