{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    ./../../modules/nixos/default.homeserver.nix
  ];

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";
  services.openssh.passwordAuthentication = true;
  services.openssh.port = 22;
  services.openssh.protocol = "2";
}
