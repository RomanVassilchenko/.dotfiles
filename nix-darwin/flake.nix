{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ pkgs.vim
        ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      security.pam.enableSudoTouchIdAuth = true;

      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        finder.AppleShowAllExtensions = true;
        # finder.FXPreferredViewStyle = "clmv";
        # loginwindow.LoginwindowText = "Roman Vasilchenko (Ozon)";
        screencapture.location = "~/Pictures/screenshots";
        screensaver.askForPasswordDelay = 10;
      };

      # Homebrew needs to be installed on its own!
      homebrew.enable = true;
      homebrew.casks = [
	      "betterdisplay"
        "dbeaver-community"
        "discord"
        "firefox"
        "font-inter"
        "font-jetbrains-mono-nerd-font"
        "google-chrome"
        "iterm2"
        "keepingyouawake"
        "postman"
        "spotify"
        "telegram"
        "visual-studio-code"
        "whatsapp"
        "zed"
      ];
      homebrew.brews = [
	      "go"
        "lima"
        "colima"
        "docker"
        "docker-compose"
        "docker-credential-helper"
        "grpc"
        "golangci-lint"
        "git"
        "vault"
        "kubectl"
        "kubectx"
        "bat"
        "btop"
        "xdg-ninja"
        "protobuf"
        "stow"
        "tmux"
        "tree"
        "tree-sitter"
        "unzip"
        "wget"
      ];
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#mbp-rovasilchenko-OZON-W0HDJTC2M5
    darwinConfigurations."mbp-rovasilchenko-OZON-W0HDJTC2M5" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."mbp-rovasilchenko-OZON-W0HDJTC2M5".pkgs;
  };
}
