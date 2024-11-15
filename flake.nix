{
  description = "Roman Vassilchenko's nixos & darwin configuration";

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

    # lanzaboote = {
    #   url = "github:nix-community/lanzaboote/v0.4.1";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # plasma-manager = {
    #   url = "github:nix-community/plasma-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.home-manager.follows = "home-manager";
    # };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    mac-app-util = {
      url = "github:hraban/mac-app-util";
    };
    nh_darwin.url = "github:ToyVo/nh_darwin";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      nix-flatpak,
      # plasma-manager,
      mac-app-util,
      nh_darwin,
      ...
    }@inputs:
    let
      username = "rovasilchenko";
      nixosSystem = "x86_64-linux";
      darwinSystem = "aarch64-darwin";
      nixosHost = "XiaoXinPro";
      darwinHost = "mbp-rovasilchenko-OZON-W0HDJTC2M5";

      pkgs = import nixpkgs {
        system = nixosSystem;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        XiaoXinPro = lib.nixosSystem {
          system = nixosSystem;
          modules = [
            ./hosts/NixOS
          ];
          specialArgs = {
            host = nixosHost;
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
                  ./modules/home/default.darwin.nix
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
