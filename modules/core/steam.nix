{ pkgs, lib, ... }: 
{
  programs = {
    steam = {
      enable = true;

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;

      gamescopeSession.enable = true;

      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
    };

    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };
  };

  environment.sessionVariables = {
    STEAM_FORCE_DESKTOPUI_SCALING = "1.25";
  };
}
