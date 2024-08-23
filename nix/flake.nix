{
  description = "Unified Darwin and NixOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, flake-utils, ... }: {
    nixosConfigurations = {
      XiaoXinPro = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./../hosts/nixos/configuration.nix
          ./../hosts/nixos/hardware-configuration.nix
        ];
      };
    };

    darwinConfigurations = {
      "mbp-rovasilchenko-OZON-W0HDJTC2M5" = nix-darwin.lib.darwinSystem {
        modules = [
          ({ pkgs, ... }: {
            system.configurationRevision = self.rev or "unknown-rev";
          })
          ./../hosts/darwin/configuration.nix
        ];
      };
    };
  };
}
