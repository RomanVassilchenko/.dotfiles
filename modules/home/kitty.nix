{ pkgs, host, ... }:
{
  programs.kitty = {
    enable = true;

    themeFile = "VSCode_Dark";

    font = {
      name = "CaskaydiaCove Nerd Font";
      size = if (host == "laptop") then 15 else 16;
    };

    settings = {
      confirm_os_window_close = 0;
      background_opacity = if (pkgs.stdenv.isLinux) then "1.00" else "1.00";
      scrollback_lines = 10000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;

      ## Tabs
      tab_title_template = "{index}";
      active_tab_font_style = "bold";
      inactive_tab_font_style = "italic";
      tab_bar_style = "powerline";
      tab_powerline_style = "angled";

      fast_tab_switching = true;
      clipboard_control = "none";

      ## Padding
      window_padding_width = 5;
      window_padding_height = 5;
    };

    keybindings = {
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      "alt+5" = "goto_tab 5";

      "ctrl+shift+left" = "no_op";
      "ctrl+shift+right" = "no_op";

      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_tab";
      "ctrl+alt+left" = "move_tab -1"; # Move tab left
      "ctrl+alt+right" = "move_tab +1"; # Move tab right
    };
  };
}
