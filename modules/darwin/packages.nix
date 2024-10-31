{
  self,
  pkgs,
  lib,
  inputs,
  ...
}:
{

  environment.systemPackages = with pkgs; [ ];
}
