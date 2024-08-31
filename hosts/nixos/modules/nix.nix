{ config, pkgs, ... }:

{
  # Enable unfree packages
  nixpkgs.config.allowUnfree = true;

  # Configure Nix settings
  nix = {
    # Disable Nix channels since flakes are used
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
