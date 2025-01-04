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
      postman
      telegram-desktop
      zed
    ]
  );
}
