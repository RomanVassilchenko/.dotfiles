{
  description = "Roman Vassilchenko's nix configuration for macOS and Linux server & laptop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-silicon-support = {
      url = "github:camuward/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util = {
      url = "github:hraban/mac-app-util";
    };

    # lanzaboote = {
    #   url = "github:nix-community/lanzaboote/v0.4.1";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      apple-silicon-support,
      nixvim,
      mac-app-util,
      nix-flatpak,
      plasma-manager,
      ...
    }@inputs:

    let
      username = "rovasilchenko";
      darwinSystem = "aarch64-darwin";
      linuxSystem = "x86_64-linux";
      nixosSystem = "x86_64-linux";
      darwinHost = "mbp-rovasilchenko-OZON-W0HDJTC2M5";
      serverHost = "Ninkear";
      laptopHost = "XiaoXinPro";

      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        XiaoXinPro = lib.nixosSystem {
          system = nixosSystem;
          modules = [
            ./hosts/NixOS
            home-manager.nixosModules.home-manager
            {
              nixpkgs.config.allowUnfree = true;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = {
                imports = [
                  ./modules/home/nixos
                  nixvim.homeManagerModules.nixvim
                ];
                _module.args.self = self;
                _module.args.host = darwinHost;
                _module.args.inputs = inputs;
                _module.args.username = username;
                home.stateVersion = "24.11";
                home.username = username;
                home.homeDirectory = "/home/${username}";
              };
            }
          ];
          specialArgs = {
            host = laptopHost;
            inherit self inputs username;
          };
        };
      };

      darwinConfigurations = {
        mbp-rovasilchenko-OZON-W0HDJTC2M5 = nix-darwin.lib.darwinSystem {
          system = darwinSystem;
          modules = [
            mac-app-util.darwinModules.default
            {
              imports = [ ./hosts/Darwin ];
              nixpkgs.config.allowUnfree = true;
              _module.args.self = self;
              _module.args.host = darwinHost;
              _module.args.inputs = inputs;
            }
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              users.users.${username} = {
                home = "/Users/${username}";
              };
              home-manager.users.${username} = {
                imports = [
                  mac-app-util.homeManagerModules.default
                  nixvim.homeManagerModules.nixvim
                  ./modules/home/darwin
                ];
                _module.args.self = self;
                _module.args.host = darwinHost;
                _module.args.inputs = inputs;
                _module.args.username = username;
                home.stateVersion = "24.11";
              };
            }
          ];
          specialArgs = {
            host = darwinHost;
            inherit self inputs username;
          };
        };
      };

      serverConfigurations = {
        Ninkear = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = linuxSystem;
            config.allowUnfree = true;
          };
          modules = [
            {
              home.username = username;
              home.homeDirectory = "/home/${username}";
              home.stateVersion = "24.11";
              imports = [
                nixvim.homeManagerModules.nixvim
                ./modules/home/ninkear
              ];
              _module.args.self = self;
              _module.args.host = serverHost;
              _module.args.inputs = inputs;
              _module.args.username = username;
            }
          ];
          extraSpecialArgs = {
            host = serverHost;
            inherit self inputs username;
          };
        };
      };
    };
}
