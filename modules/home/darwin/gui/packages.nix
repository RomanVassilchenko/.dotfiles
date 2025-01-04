{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      gimp
      google-chrome
      inkscape
      jetbrains.datagrip
      jetbrains.goland
      obsidian
      raycast
      telegram-desktop
      zed
    ]
  );
}
