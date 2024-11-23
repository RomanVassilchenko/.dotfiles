{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      google-chrome
      mkalias
      raycast
      # whatsapp-for-mac
    ]
  );
}
