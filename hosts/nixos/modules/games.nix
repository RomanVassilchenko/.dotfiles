{
  config,
  pkgs,
  lib,
  ...
}:

let
  gamePackages = with pkgs; [
    adwsteamgtk
    heroic
    lutris
    osu-lazer
    prismlauncher
    ryujinx
    bottles
    itch
  ];
in
{
  environment.systemPackages = lib.mkMerge [
    config.environment.systemPackages
    gamePackages
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };

  environment.sessionVariables.STEAM_FORCE_DESKTOPUI_SCALING = "1.25";
}
