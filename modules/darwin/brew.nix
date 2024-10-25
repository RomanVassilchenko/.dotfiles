{
  inputs,
  nixpkgs,
  pkgs,
  config,
  self,
  username,
  host,
  ...
}:
{
  homebrew.enable = true;
  homebrew.onActivation = {
    autoUpdate = true;
    cleanup = "zap";
    upgrade = true;
    extraFlags = [
      "--verbose"
      "--debug"
    ];
  };
  homebrew.casks = [
    "betterdisplay"
    "dbeaver-community"
    "google-chrome"
    "iterm2"
    "keepingyouawake"
    "krita"
    "kdenlive"
    "whatsapp"
    "goland"
    "obs"
    "zen-browser"
    "arc"
    "visual-studio-code"
  ];
  homebrew.brews = [ "go" ];
}
