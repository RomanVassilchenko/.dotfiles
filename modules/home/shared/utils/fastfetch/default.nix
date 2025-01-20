{
  pkgs,
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
          ndigits = 1;
        };
        percent = {
          type = 2;
        };
        key = {
          Width = 1;
        };
      };

      # logo =
      #   if pkgs.stdenv.hostPlatform.isLinux then
      #     {
      #       type = "file";
      #       source = "${./nixos-logo.txt}";
      #       padding = {
      #         top = 0;
      #         left = 1;
      #         right = 2;
      #       };
      #     }
      #   else
      #     {
      #       type = "file";
      #       source = "${./darwin-logo.txt}";
      #       padding = {
      #         top = 0;
      #         left = 1;
      #         right = 2;
      #       };
      #     };

      modules =
        [
          {
            type = "title";
            color = {
              user = "magenta";
              host = "cyan";
            };
            padding = {
              left = 2;
            };
          }
          {
            type = "separator";
            string = "━";
            color = "blue";
          }
          {
            type = "os";
            key = "┏━▶ 󰣇 OS      ";
            format = "{3} ({12})";
            keyColor = "green";
          }
          {
            type = "host";
            key = "┣━▶ 󰌢 Machine ";
            keyColor = "green";
          }
          {
            type = "kernel";
            key = "┣━▶ 󰒔 Kernel  ";
            format = "{1} {2}";
            keyColor = "green";
          }
          {
            type = "cpu";
            key = "┣━▶ 󰻠 CPU     ";
            keyColor = "green";
          }
          {
            type = "gpu";
            key = "┣━▶ 󰢮 GPU     ";
            keyColor = "green";
          }
          {
            type = "memory";
            key = "┣━▶ 󰍛 Memory  ";
            keyColor = "green";
          }
          {
            type = "shell";
            key = "┣━▶ 󰆍 Shell   ";
            format = "{1} {4}";
            keyColor = "green";
          }
          {
            type = "packages";
            key = "┣━▶ 󰏗 Pkgs    ";
            keyColor = "green";
          }
          {
            type = "uptime";
            key = "┗━▶ 󰅐 Uptime  ";
            keyColor = "green";
          }
          "break"
          {
            type = "display";
            key = "┏━▶ 󰍹 Screen  ";
            keyColor = "yellow";
            compactType = "original";
          }
          {
            type = "de";
            key = "┣━▶ 󰧨 DE      ";
            keyColor = "yellow";
          }
          {
            type = "wm";
            key = "┣━▶ 󱂬 WM      ";
            keyColor = "yellow";
          }
          {
            type = "theme";
            key = "┣━▶ 󰉼 Theme   ";
            keyColor = "yellow";
          }
          {
            type = "icons";
            key = "┣━▶  Icons   ";
            keyColor = "yellow";
          }
          {
            type = "terminal";
            key = "┗━▶ 󰆍 Term    ";
            format = "{3}";
            keyColor = "yellow";
          }
          "break"
          {
            type = "colors";
            symbol = "circle";
            padding = {
              left = 2;
            };
          }
        ]
        ++ (
          if pkgs.stdenv.hostPlatform.isLinux then
            [
              "break"
              {
                type = "command";
                key = "┗━▶ 󰚰 Install ";
                text = "bash -c 'birth_install=$(stat -c %W /); current=$(date +%s); delta=$((current - birth_install)); delta_days=$((delta / 86400)); echo $delta_days days'";
                keyColor = "green";
              }
            ]
          else
            [
              "break"
              {
                type = "command";
                key = "┣━▶ 󰌘 Ozon    ";
                text = "echo 'Working in Ozon Tech for '$(( ($(date +%s) - 1702252800) / 86400 )) 'days'";
                keyColor = "green";
              }
              {
                type = "command";
                key = "┗━▶ 󰀵 Staff   ";
                text = "echo 'Working in Staff Team for '$(( ($(date +%s) - 1723420800) / 86400 )) 'days'";
                keyColor = "green";
              }
            ]
        );
    };
  };
}
