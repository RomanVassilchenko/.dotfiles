{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
  ];

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh = {
    enable = true;
  };
  system.stateVersion = 4;
  nixpkgs.hostPlatform = "aarch64-darwin";

  security.pam.enableSudoTouchIdAuth = true;

  system.defaults = {
    dock.autohide = true;
    dock.mru-spaces = false;
    finder.AppleShowAllExtensions = true;
    screencapture.location = "~/Pictures/screenshots";
    screensaver.askForPasswordDelay = 10;
  };

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
}
