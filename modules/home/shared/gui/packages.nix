{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      # ghostty
      gimp
      google-chrome
      inkscape
      # jetbrains.datagrip
      # jetbrains.goland
      logseq
      obsidian
      postman
      telegram-desktop
      zed
    ]
  );
}
