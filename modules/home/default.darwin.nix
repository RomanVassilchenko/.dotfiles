{
  inputs,
  username,
  host,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./bat.nix # Better cat command
    ./btop.nix # Resource monitor
    ./discord/discord.nix # Discord with Gruvbox theme
    ./fastfetch.nix # Fetch tool
    ./fzf.nix # Fuzzy finder
    ./git.nix # Version control
    ./kitty.nix # Terminal
    ./micro.nix # Nano replacement
    ./nvim.nix # Neovim editor
    ./p10k/p10k.nix # Powerlevel10k theme
    ./common-packages.nix # Other packages
    ./darwin-packages.nix # macOS-specific packages
    ./starship.nix # Shell prompt
    ./vscode.nix
    ./zellij.nix
    ./zsh # Shell configuration
  ];

  # Git configuration
  programs.git = {
    userName = lib.mkForce "rovasilchenko";
    userEmail = lib.mkForce "rovasilchenko@ozon.ru";
    extraConfig.init.defaultBranch = lib.mkForce "master";
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # programs = {
  #   tmux = {
  #     enable = true;
  #     clock24 = true;
  #     aggressiveResize = true;
  #     baseIndex = 1;
  #     disableConfirmationPrompt = true;
  #     keyMode = "vi";
  #     newSession = true;
  #     secureSocket = true;
  #     shell = "${pkgs.zsh}/bin/zsh";
  #     shortcut = "a";
  #     terminal = "screen-256color";

  #     plugins = with pkgs.tmuxPlugins; [
  #       yank
  #       sensible
  #       vim-tmux-navigator
  #     ];

  #     extraConfig = ''
  #       # set-default colorset-option -ga terminal-overrides ",xterm-256color:Tc"
  #       set -as terminal-features ",xterm-256color:RGB"
  #       # set-option -sa terminal-overrides ",xterm*:Tc"
  #       set -g mouse on

  #       unbind C-b
  #       set -g prefix C-Space
  #       bind C-Space send-prefix

  #       # Vim style pane selection
  #       bind h select-pane -L
  #       bind j select-pane -D
  #       bind k select-pane -U
  #       bind l select-pane -R

  #       # Start windows and panes at 1, not 0
  #       set -g base-index 1
  #       set -g pane-base-index 1
  #       set-window-option -g pane-base-index 1
  #       set-option -g renumber-windows on

  #       # Bind clearing the screen
  #       bind L send-keys '^L'

  #       # Use Alt-arrow keys without prefix key to switch panes
  #       bind -n M-Left select-pane -L
  #       bind -n M-Right select-pane -R
  #       bind -n M-Up select-pane -U
  #       bind -n M-Down select-pane -D

  #       # Shift arrow to switch windows
  #       bind -n S-Left  previous-window
  #       bind -n S-Right next-window

  #       # Shift Alt vim keys to switch windows
  #       bind -n M-H previous-window
  #       bind -n M-L next-window

  #       # set vi-mode
  #       set-window-option -g mode-keys vi

  #       # keybindings
  #       bind-key -T copy-mode-vi v send-keys -X begin-selection
  #       bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
  #       bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

  #       bind '"' split-window -v -c "#{pane_current_path}"
  #       bind % split-window -h -c "#{pane_current_path}"
  #       bind c new-window -c "#{pane_current_path}"
  #     '';
  #   };

  # };

  # Define PATH and session variables
  home.sessionVariables = lib.mkMerge [
    {
      # Define XDG and Go paths
      XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
      XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
      XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
      XDG_RUNTIME_DIR = "/run/user/$(id -u)";
      GOPATH = "${config.home.homeDirectory}/.local/share/go";

      PATH = lib.mkAfter "${config.home.homeDirectory}/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:/etc/profiles/per-user/${username}/bin:/opt/homebrew/bin:/run/current-system/sw/bin:${config.home.homeDirectory}/.o3-cli/bin:${pkgs.coreutils}/bin:/bin:/usr/bin:/usr/local/go/bin:/usr/local/bin:/sbin:${config.home.sessionVariables.GOPATH}/bin";
    }
  ];
}
