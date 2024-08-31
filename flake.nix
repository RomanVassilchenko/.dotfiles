{
  description = "Unified Darwin and NixOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable-small";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nix-darwin.url = "github:LnL7/nix-darwin";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, flake-utils, ... }:
    let
      nixosSystem = "x86_64-linux";
      darwinSystem = "aarch64-darwin";
    in {
    nixosConfigurations = {
      XiaoXinPro = nixpkgs.lib.nixosSystem {
        system = nixosSystem;
        modules = [
          ./hosts/nixos/configuration.nix
          ./hosts/nixos/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.rovasilchenko = import ./hosts/nixos/home.nix;
            home-manager.backupFileExtension = "backup";
          }
        ];
      };
    };

    darwinConfigurations = {
      "mbp-rovasilchenko-OZON-W0HDJTC2M5" = nix-darwin.lib.darwinSystem {
        system = darwinSystem;
        modules = [
          ({ pkgs, ... }: {
            system.configurationRevision = self.rev or "unknown-rev";
          })
          ./hosts/darwin/configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.rovasilchenko = import ./hosts/darwin/home.nix;
            home-manager.backupFileExtension = "backup";
          }
        ];
      };
    };

    homeConfigurations = {
      nixosHome = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = nixosSystem; };
        homeDirectory = "/home/rovasilchenko";
        modules = [
          ./hosts/nixos/home.nix
        ];
      };

      darwinHome = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = darwinSystem; };
        homeDirectory = "/Users/rovasilchenko";
        modules = [
          ./hosts/darwin/home.nix
        ];
      };
    };
  };
}
