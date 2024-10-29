{
  self,
  pkgs,
  lib,
  inputs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    goose
    kubectl
    # mas
    mkalias
  ];
}
