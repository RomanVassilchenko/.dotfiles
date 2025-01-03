{
  description = "Roman Vassilchenko's darwin configuration";

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
      ...
    }@inputs:
    let
      username = "rovasilchenko";
      darwinSystem = "aarch64-darwin";
      darwinHost = "mbp-rovasilchenko-OZON-W0HDJTC2M5";
    in
    {
      darwinConfigurations = {
        mbp-rovasilchenko-OZON-W0HDJTC2M5 = nix-darwin.lib.darwinSystem {
          system = darwinSystem;
          modules = [
            mac-app-util.darwinModules.default
            {
              imports = [ ./hosts/Darwin ];
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
                  ./modules/home
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
    };
}
