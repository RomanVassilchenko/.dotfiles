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
    "arc"
    "betterdisplay"
    "dbeaver-community"
    "goland"
    "google-chrome"
    "iterm2"
    "kdenlive"
    "keepingyouawake"
    "krita"
    "raycast"
    "obs"
    "thunderbird"
    "visual-studio-code"
    "whatsapp"
    "zen-browser"
  ];
  homebrew.brews = [ "go" ];
}
