{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "Visual Studio Dark+";
    };
    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      batgrep
      batdiff
    ];
  };
}
