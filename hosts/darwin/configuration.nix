{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
  ];

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  environment.shellAliases.up = "darwin-rebuild switch --flake /Users/rovasilchenko/.dotfiles/nix#mbp-rovasilchenko-OZON-W0HDJTC2M5";

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableFzfCompletion = true;
    enableFzfGit = true;
    enableFzfHistory = true;
    enableSyntaxHighlighting = true;
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
    "alt-tab"
    "goland"
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
    "fzf"
    "zoxide"
    "pandoc"
    "neovim"
    "ripgrep"
  ];
}
