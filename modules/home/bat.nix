{ pkgs, lib, ... }:
{
  programs.bat = {
    enable = true;

    config = {
      pager = "less -FR";

      # Apply theme only on Linux
      theme = lib.optionalString pkgs.stdenv.hostPlatform.isLinux "gruvbox-dark";
    };

    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      batgrep
      # batdiff
    ];
  };
}
