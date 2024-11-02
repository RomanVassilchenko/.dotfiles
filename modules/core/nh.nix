{
  pkgs,
  username,
  lib,
  ...
}:
{
  programs.nh =
    {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5";
      };
    }
    // lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
      flake = "/home/${username}/.dotfiles";
    };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
