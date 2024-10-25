{ inputs, pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      docker
      docker-compose
      goose
      kubectl
      # mas
      mkalias
      zellij
    ]
  );
}
