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
            key = "╭─ ";
            format = "{3} ({12})";
            keyColor = "32";
          }
          {
            type = "host";
            key = "├─󰟀 ";
            keyColor = "32";
          }
          {
            type = "kernel";
            key = "├─󰒔 ";
            format = "{1} {2}";
            keyColor = "32";
          }
          {
            type = "shell";
            key = "├─$ ";
            format = "{1} {4}";
            keyColor = "32";
          }
          {
            type = "packages";
            key = "├─ ";
            keyColor = "32";
          }
          {
            type = "uptime";
            key = "├─󰔚 ";
            keyColor = "32";
          }
        ]

        ++ (
          if pkgs.stdenv.hostPlatform.isLinux then
            [
              {
                type = "custom";
                key = "╰─󰥔 ";
                valueCommand = ''birth_install=$(find / -type f -print0 2>/dev/null | xargs -0 stat -f "%B" 2>/dev/null | sort | head -n 1); current=$(date +%s); delta=$((current - birth_install)); delta_days=$((delta / 86400)); echo "$delta_days days"'';
                keyColor = "32";
              }
            ]
          else
            [
              {
                type = "custom";
                key = "╰─󰷜 ";
                valueCommand = ''
                  days_since_ozon=$(( ( $(date +"%s") - 1702252800 ) / 86400 ))
                  echo "Days since started at Ozon: $days_since_ozon days"
                '';
                keyColor = "32";
              }
              {
                type = "custom";
                key = "╰─ ";
                valueCommand = ''
                  days_since_m1_pro=$(( ( $(date +"%s") - 1723420800 ) / 86400 ))
                  echo "Days since using M1 Pro: $days_since_m1_pro days"
                '';
                keyColor = "32";
              }

            ]
        )

        ++ [
          "break"
          {
            type = "display";
            key = "╭─󰹑 ";
            keyColor = "33";
            compactType = "original";
          }
          {
            type = "de";
            key = "├─󰧨 ";
            keyColor = "33";
          }
          {
            type = "wm";
            key = "├─ ";
            keyColor = "33";
          }
          {
            type = "theme";
            key = "├─󰉼 ";
            keyColor = "33";
          }
          {
            type = "icons";
            key = "├─ ";
            keyColor = "33";
          }
          {
            type = "cursor";
            key = "├─󰳽 ";
            keyColor = "33";
          }
          {
            type = "font";
            key = "├─ ";
            format = "{2}";
            keyColor = "33";
          }
          {
            type = "terminal";
            key = "╰─ ";
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
