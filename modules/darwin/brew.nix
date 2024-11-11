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
      "dbeaver-community"
      "krita"
      "obs"
      "telegram"
      "whatsapp"
      "zen-browser"
    ];
    brews = [ ];
  };
}
