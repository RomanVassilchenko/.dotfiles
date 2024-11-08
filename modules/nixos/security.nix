{ ... }:
{
  security.rtkit.enable = true;
  security.polkit.enable = true; # Use polkit for access to shutdown, reboot etc.
  security.sudo.enable = true;
  # security.pam.services.swaylock = { };
  # security.pam.services.hyprlock = { };
}
