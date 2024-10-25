{
  self,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "24.05";
}
