{
  pkgs,
  username,
  lib,
  ...
}:
{
  programs.fastfetch = {
    enable = true;

    settings = {
      display = {
        separator = "";
        size = {
          binaryPrefix = "si";
          ndigits = 0;
        };
        percent = {
          type = 1;
        };
        key = {
          Width = 1;
        };
      };

      logo =
        if pkgs.stdenv.hostPlatform.isLinux then
          {
            source = "${../../.github/assets/logo/nixos-logo.png}";
            type = "kitty-direct";
            width = 33;
            padding = {
              top = 2;
            };
          }
        else
          { };

      modules =
        [
          {
            type = "title";
            color = {
              user = "35";
              host = "36";
            };
          }
          {
            type = "separator";
            string = "▔";
          }
          {
            type = "os";
            key = "╭─  System:         ";
            format = "{3} ({12})";
            keyColor = "32";
          }
          {
            type = "host";
            key = "├─󰟀  Laptop:         ";
            keyColor = "32";
          }
          {
            type = "kernel";
            key = "├─󰒔  Kernel:         ";
            format = "{1} {2}";
            keyColor = "32";
          }
          {
            type = "shell";
            key = "├─$  Shell:          ";
            format = "{1} {4}";
            keyColor = "32";
          }
          {
            type = "packages";
            key = "├─  Packages:       ";
            keyColor = "32";
          }
          {
            type = "uptime";
            key = "├─󰔚  Uptime:         ";
            keyColor = "32";
          }
        ]

        ++ (
          if pkgs.stdenv.hostPlatform.isLinux then
            [
              {
                type = "command";
                key = "╰─󰥔  Birth Install:    ";
                text = "bash -c 'if [[ \"$(uname)\" == \"Darwin\" ]]; then birth_install=$(stat -f %B /); else birth_install=$(stat -c %W /); fi; current=$(date +%s); delta=$((current - birth_install)); delta_days=$((delta / 86400)); echo $delta_days days'";
                keyColor = "32";
              }
            ]
          else
            [
              {
                type = "command";
                key = "├─󰷜  Days at Ozon:   ";
                text = "bash -c 'days_since_ozon=$(( ($(date +%s) - 1702252800) / 86400 )); echo \"$days_since_ozon days\"'";
                keyColor = "32";
              }
              {
                type = "command";
                key = "╰─  Days at M1 Pro: ";
                text = "bash -c 'days_since_m1_pro=$(( ($(date +%s) - 1723420800) / 86400 )); echo \"$days_since_m1_pro days\"'";
                keyColor = "32";
              }

            ]
        )

        ++ [
          "break"
          {
            type = "display";
            key = "╭─󰹑  Resolution:     ";
            keyColor = "33";
            compactType = "original";
          }
          {
            type = "de";
            key = "├─󰧨  DE:             ";
            keyColor = "33";
          }
          {
            type = "wm";
            key = "├─  WM:             ";
            keyColor = "33";
          }
          {
            type = "theme";
            key = "├─󰉼  Theme:          ";
            keyColor = "33";
          }
          {
            type = "icons";
            key = "├─  Icons:          ";
            keyColor = "33";
          }
          {
            type = "cursor";
            key = "├─󰳽  Cursor:         ";
            keyColor = "33";
          }
          {
            type = "font";
            key = "├─  Font:           ";
            format = "{2}";
            keyColor = "33";
          }
          {
            type = "terminal";
            key = "╰─  Terminal:       ";
            format = "{3}";
            keyColor = "33";
          }
          "break"
          {
            type = "colors";
            symbol = "block";
          }
        ];
    };
  };
}
