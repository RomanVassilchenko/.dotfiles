{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gamemode
    gamescope
    prismlauncher
    heroic
    lutris
    bottles
    cartridges
    ryujinx
    itch
    osu-lazer
  ];
}
