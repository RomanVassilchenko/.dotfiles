{
  pkgs,
  inputs,
  username,
  host,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs username host;
    };
    backupFileExtension = "hm-backup";

    users.${username} = {
      imports = [
        ./../home/default.homeserver.nix
      ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.11";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    hashedPassword = "$y$j9T$t7/JTjBH4SPvXAT0hgCaA1$lbdcOEjaAVBBMaym8PMJpv/RVoUAsnbzCRuYO7ZgTo4"; # Created using mkpasswd
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDa3PscSk+I57dKdihh2+KQOD2/nc+JBAKnL/wcorCoWUh+ad5eDGsMt+wgtnQMLakO90itmtFIYIJsekQYB7bg3QZuT5Cfx6tBANN3owLll/fdBkyi4TA4wLWOWh3z6RkCHrWmJUtiLsQ6rH3gPiBXliviyWyZ4SJKke20ujJUcfhSiujlGHu4hJPjpPjtXVKqNPq763kOPyfEhrLy6IVoGMYSp0KgF0URAb5HmYysUmccTBJFjRuZkmR61Irux1DPqkw2pRpckT8qhvRho2676jT6nAaWkVkoXd+9NDT+SOjLiYpi2ONQsW51EI4fVPMGCaZ6puFucY/lpkGMrdRhW0EhmS2m09fsPc4Ie1v1hGWA0pcDezyuOPF912C1y9N3gSTudUVlwX5V/hQDXnd+1RR3i5JSdR6Xw1n7uj6Zs8cTkfd0iVwUSgSGyxSLLxVS+o4jgvG7REClirCR+4isPrd0EyUxr09CjhMXGe5cvzxQhJbPqfialnSw86uxDyfuYrs+Kou4yN/zkCndEAZogJ9ri5NNsvr5Kt8LMaE4lS/2zDb2107jvvwXCZEhAzr9dxt+XmNGtPBDXmdMuavzs1mSkr+krq3BW/J0JTDBiF+zSJsPlC4tI+NE3xULOIpRNqHYS2oMIWQpaCXow8xlyPB8onoaIFn5pz69a5w9Ow== rovasilchenko@mbp-rovasilchenko-OZON-W0HDJTC2M5"
    ];
  };

  nix.settings.allowed-users = [ "${username}" ];

  nix.settings = {
    keep-outputs = true;
    keep-derivations = true;
  };

  services.getty.autologinUser = "${username}";

  system.autoUpgrade.enable = false;
  system.autoUpgrade.allowReboot = false;
}
