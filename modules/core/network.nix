{ pkgs, host, ... }:
{
  networking = {
    hostName = "${host}";
  };
}
