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
  homebrew = {
    enable = true;
    global = {
      autoUpdate = false;
    };
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
      extraFlags = [
        "--verbose"
        "--debug"
      ];
    };
    casks = [
      "arc"
      "betterdisplay"
      "goland"
      "iterm2"
      "kdenlive"
      "keepingyouawake"
      "krita"
      "obs"
      "telegram"
      "thunderbird"
      "visual-studio-code" # -> vscode
      "whatsapp"
      "zen-browser"
    ];
    brews = [
      "go"
    ];
  };
}
