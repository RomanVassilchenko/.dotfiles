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
      "betterdisplay"
      "datagrip"
      "dbeaver-community"
      "goland"
      "kdenlive"
      "krita"
      "obs"
      "telegram"
      "thunderbird"
      "whatsapp"
      "zen-browser"
    ];
    brews = [ ];
  };
}
