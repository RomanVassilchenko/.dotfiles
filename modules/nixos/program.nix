{ ... }:
{
  programs.dconf.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.nix-ld.enable = true;

  environment.variables = {
    OZONE_PLATFORM = "wayland";
    NIXOS_OZONE_WL = "1";
  };
}
