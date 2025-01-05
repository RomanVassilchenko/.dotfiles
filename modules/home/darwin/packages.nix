{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      raycast
      mkalias
    ]
  );
}
