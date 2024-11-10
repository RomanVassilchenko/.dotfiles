{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # obs-studio
    # obs-studio-plugins.obs-backgroundremoval
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-backgroundremoval
    ];
  };

}
