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
    ./bat.nix # better cat command
    ./btop.nix # resouces monitor
    ./discord/discord.nix # discord with gruvbox
    ./fastfetch.nix # fetch tool
    ./fzf.nix # fuzzy finder
    ./git.nix # version control
    ./kitty.nix # terminal
    ./micro.nix # nano replacement
    ./nvim.nix # neovim editor
    ./p10k/p10k.nix
    ./common-packages.nix # other packages
    ./darwin-packages.nix # other packages
    ./starship.nix # shell prompt
    # ./vscode.nix # vscode fork
    # ./wezterm.nix # terminal
    ./zsh # shell
  ];

  programs.git = {
    userName = lib.mkForce "rovasilchenko";
    userEmail = lib.mkForce "rovasilchenko@ozon.ru";
    extraConfig.init.defaultBranch = lib.mkForce "master";
  };

  programs = {
    # zsh = {
    #   enable = true;
    #   enableCompletion = true;
    #   syntaxHighlighting.enable = true;
    #   autosuggestion.enable = true;

    #   shellAliases = {
    #     v = "nvim";
    #     cat = "bat";
    #     ls = "eza --icons";
    #     ll = "eza -lh --icons --grid --group-directories-first";
    #     la = "eza -lah --icons --grid --group-directories-first";
    #     ".." = "cd ..";

    #   };

    #   history = {
    #     size = 10000;
    #     # path = "${config.xdg.dataHome}/zsh/history";
    #   };

    #   oh-my-zsh = {
    #     enable = true;
    #     plugins = [
    #       "git"
    #       "sudo"
    #       "fzf"
    #       "docker"
    #       "docker-compose"
    #       "zoxide"
    #     ];
    #     theme = "agnoster";
    #   };
    # };
    # fastfetch = {
    #   enable = true;

    #   settings = {
    #     display = {
    #       color = {
    #         keys = "35";
    #         output = "90";
    #       };
    #     };

    #     # logo = {
    #     #   source = ./nixos.png;
    #     #   type = "kitty-direct";
    #     #   height = 15;
    #     #   width = 30;
    #     #   padding = {
    #     #     top = 3;
    #     #     left = 3;
    #     #   };
    #     # };

    #     modules = [
    #       "break"
    #       {
    #         type = "custom";
    #         format = "┌────────────────────────Hardware────────────────────────┐";
    #       }
    #       {
    #         type = "cpu";
    #         key = "│  ";
    #       }
    #       {
    #         type = "gpu";
    #         key = "│ 󰍛 ";
    #       }
    #       {
    #         type = "memory";
    #         key = "│ 󰑭 ";
    #       }
    #       {
    #         type = "custom";
    #         format = "└────────────────────────────────────────────────────────┘";
    #       }
    #       "break"
    #       {
    #         type = "custom";
    #         format = "┌────────────────────────Software────────────────────────┐";
    #       }
    #       {
    #         type = "custom";
    #         format =
    #           if pkgs.stdenv.isDarwin then " OS -> Ozon MacBook Pro M1Pro" else " OS -> XiaoXinPro NixOS";
    #       }
    #       {
    #         type = "kernel";
    #         key = "│ ├ ";
    #       }
    #       {
    #         type = "packages";
    #         key = "│ ├󰏖 ";
    #       }
    #       {
    #         type = "shell";
    #         key = "└ └ ";
    #       }
    #       "break"
    #       {
    #         type = "wm";
    #         key = " WM";
    #       }
    #       {
    #         type = "wmtheme";
    #         key = "│ ├󰉼 ";
    #       }
    #       {
    #         type = "terminal";
    #         key = "└ └ ";
    #       }
    #       {
    #         type = "custom";
    #         format = "└────────────────────────────────────────────────────────┘";
    #       }
    #       "break"
    #       {
    #         type = "custom";
    #         format = "┌──────────────────────Uptime / Age──────────────────────┐";
    #       }
    #       {
    #         type = "command";
    #         key = "│  ";
    #         text = # bash
    #           ''
    #             birth_install=$(stat -c %W /)
    #             current=$(date +%s)
    #             delta=$((current - birth_install))
    #             delta_days=$((delta / 86400))
    #             echo $delta_days days
    #           '';
    #       }
    #       {
    #         type = "uptime";
    #         key = "│  ";
    #       }
    #       {
    #         type = "custom";
    #         format = "└────────────────────────────────────────────────────────┘";
    #       }
    #       "break"
    #     ];
    #   };
    # };

    # tmux = {
    #   enable = true;
    #   clock24 = true;
    #   aggressiveResize = true;
    #   baseIndex = 1;
    #   disableConfirmationPrompt = true;
    #   keyMode = "vi";
    #   newSession = true;
    #   secureSocket = true;
    #   shell = "${pkgs.zsh}/bin/zsh";
    #   shortcut = "a";
    #   terminal = "screen-256color";

    #   plugins = with pkgs.tmuxPlugins; [
    #     yank
    #     sensible
    #     vim-tmux-navigator
    #   ];

    #   extraConfig = ''
    #     # set-default colorset-option -ga terminal-overrides ",xterm-256color:Tc"
    #     set -as terminal-features ",xterm-256color:RGB"
    #     # set-option -sa terminal-overrides ",xterm*:Tc"
    #     set -g mouse on

    #     unbind C-b
    #     set -g prefix C-Space
    #     bind C-Space send-prefix

    #     # Vim style pane selection
    #     bind h select-pane -L
    #     bind j select-pane -D
    #     bind k select-pane -U
    #     bind l select-pane -R

    #     # Start windows and panes at 1, not 0
    #     set -g base-index 1
    #     set -g pane-base-index 1
    #     set-window-option -g pane-base-index 1
    #     set-option -g renumber-windows on

    #     # Bind clearing the screen
    #     bind L send-keys '^L'

    #     # Use Alt-arrow keys without prefix key to switch panes
    #     bind -n M-Left select-pane -L
    #     bind -n M-Right select-pane -R
    #     bind -n M-Up select-pane -U
    #     bind -n M-Down select-pane -D

    #     # Shift arrow to switch windows
    #     bind -n S-Left  previous-window
    #     bind -n S-Right next-window

    #     # Shift Alt vim keys to switch windows
    #     bind -n M-H previous-window
    #     bind -n M-L next-window

    #     # set vi-mode
    #     set-window-option -g mode-keys vi

    #     # keybindings
    #     bind-key -T copy-mode-vi v send-keys -X begin-selection
    #     bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
    #     bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

    #     bind '"' split-window -v -c "#{pane_current_path}"
    #     bind % split-window -h -c "#{pane_current_path}"
    #     bind c new-window -c "#{pane_current_path}"
    #   '';
    # };

    # zoxide = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   options = [ "--cmd cd" ];
    # };

    # fzf = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   tmux.enableShellIntegration = true;
    # };

    # kitty = {
    #   enable = true;
    #   package = pkgs.kitty;
    #   settings = {
    #     scrollback_lines = 2000;
    #     wheel_scroll_min_lines = 1;
    #     window_padding_width = 4;
    #     confirm_os_window_close = 0;

    #     font_family = "JetBrainsMono Nerd Font";
    #     font_size = 16;
    #     bold_font = "JetBrainsMono Nerd Font Bold";
    #     italic_font = "JetBrainsMono Nerd Font Italic";
    #     bold_italic_font = "JetBrainsMono Nerd Font Bold Italic";

    #     opacity = 1.0; # Set to 1 for full opacity
    #     window_title = "Kitty";
    #     dynamic_title = true;

    #     # Cursor style similar to Alacritty
    #     cursor_shape = "block";
    #   };

    #   extraConfig = ''
    #     # Tab bar styling
    #     tab_bar_style fade
    #     tab_fade 1
    #     active_tab_font_style   bold
    #     inactive_tab_font_style bold

    #     # Set environment variable to match Alacritty TERM
    #     env TERM xterm-256color
    #   '';
    # };

    # alacritty = {
    #   enable = true;

    #   settings = {
    #     window = {
    #       padding = {
    #         x = 4;
    #         y = 8;
    #       };
    #       decorations = "full";
    #       opacity = 1;
    #       startup_mode = "Windowed";
    #       title = "Alacritty";
    #       dynamic_title = true;
    #       decorations_theme_variant = "None";
    #     };

    #     # import = [ pkgs.alacritty-theme.tokyo-night ];

    #     font =
    #       let
    #         jetbrainsMono = style: {
    #           family = "JetBrainsMono Nerd Font";
    #           inherit style;
    #         };
    #       in
    #       {
    #         # size = if meta.name == "karasu" then 12 else 16;
    #         size = 16;
    #         normal = jetbrainsMono "Regular";
    #         bold = jetbrainsMono "Bold";
    #         italic = jetbrainsMono "Italic";
    #         bold_italic = jetbrainsMono "Bold Italic";
    #       };

    #     cursor = {
    #       style = "Block";
    #     };

    #     env = {
    #       TERM = "xterm-256color";
    #     };

    #     live_config_reload = true;
    #   };
    # };
  };

  home.homeDirectory = lib.mkForce "/Users/rovasilchenko";

  home.sessionVariables = lib.mkMerge [
    {
      XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
      XDG_STATE_HOME = "${config.home.homeDirectory}/.local/state";
      XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
      XDG_RUNTIME_DIR = "/run/user/$(id -u)";

      GOPATH = "${config.home.homeDirectory}/.local/share/go";
      # LESSHISTFILE = "${config.home.homeDirectory}/.local/state/less/history";
      # ZPLUG_HOME = "${config.home.homeDirectory}/.local/share/zplug";
      # HISTFILE = "${config.home.homeDirectory}/.local/state/zsh/history";
      # ZDOTDIR = "${config.home.homeDirectory}/.config/zsh";
      PATH = lib.mkAfter "/run/current-system/sw/bin:${config.home.homeDirectory}/.o3-cli/bin:${pkgs.coreutils}/bin:/bin:/usr/bin:/usr/local/go/bin:/usr/local/bin:/sbin:${config.home.sessionVariables.GOPATH}/bin:/opt/homebrew/bin";
    }
  ];
}
