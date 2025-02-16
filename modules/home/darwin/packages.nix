{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      betterdisplay
      # ghostty
      raycast
      mkalias
    ]
  );
}
