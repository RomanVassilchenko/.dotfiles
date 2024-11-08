{
  self,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LANG = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
      LC_COLLATE = "en_US.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_MESSAGES = "en_US.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_ADDRESS = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
    };
  };

  system.stateVersion = "24.11";
}
