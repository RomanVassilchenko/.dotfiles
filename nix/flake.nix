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

  outputs = { self, nixpkgs, nix-darwin, home-manager, flake-utils, ... }:
    let
      system = "x86_64-linux";
    in{
    nixosConfigurations = {
      XiaoXinPro = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./../hosts/nixos/configuration.nix
          ./../hosts/nixos/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.rovasilchenko = import ./../hosts/nixos/home.nix;
            home-manager.backupFileExtension = "backup";
          }
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

    homeConfigurations = {
      rovasilchenko = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        homeDirectory = "/home/rovasilchenko";
        modules = [
          ./../hosts/nixos/home.nix
        ];
      };
    };
  };
}
