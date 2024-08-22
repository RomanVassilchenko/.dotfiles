{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    adwsteamgtk
    heroic
    lutris
    osu-lazer
    prismlauncher
    ryujinx
    bottles
    itch
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };
}
