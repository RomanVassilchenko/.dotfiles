{
  pkgs,
  inputs,
  ...
}:
{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    # optimise.automatic = true; # Turn on after fix of https://github.com/NixOS/nix/issues/7273/
  };
  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  time.timeZone = "Asia/Almaty";
  nixpkgs.config.allowUnfree = true;
}
