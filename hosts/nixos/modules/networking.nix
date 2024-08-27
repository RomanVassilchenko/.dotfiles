{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "XiaoXinPro";

  # networking.firewall = {
  #   enable = true;
  #   allowedTCPPortRanges = [
  #     { from = 1714; to = 1764; } # KDE Connect
  #   ];
  #   allowedUDPPortRanges = [
  #     { from = 1714; to = 1764; } # KDE Connect
  #   ];

  #   allowedTCPPorts = [7236 7250];
  #   allowedUDPPorts = [7236 5353];
  # };
}
