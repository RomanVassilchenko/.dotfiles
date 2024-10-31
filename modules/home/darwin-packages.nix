{ inputs, pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      google-chrome
      # mas
      mkalias
      raycast
    ]
  );
}
