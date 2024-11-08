{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = (
    with pkgs;
    [
      gnome-tweaks
      gnome-extension-manager

      inter
      libertinus
      whatsapp-emoji-font
      jetbrains-mono
      fira-code
      ibm-plex
      font-awesome
      noto-fonts
      # evince                                        # pdf
      # file-roller                                   # archive
      # gnome-text-editor                             # gedit
    ]
  );

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false; # enables user extensions
        enabled-extensions = [
          # Put UUIDs of extensions that you want to enable here.
          # If the extension you want to enable is packaged in nixpkgs,
          # you can easily get its UUID by accessing its extensionUuid
          # field (look at the following example).
          # pkgs.gnomeExtensions.gsconnect.extensionUuid

          # Alternatively, you can manually pass UUID as a string.
          # "blur-my-shell@aunetx"
          # ...
          "appindicatorsupport@rgcjonas.gmail.com"
          "AlphabeticalAppGrid@stuarthayhurst"
          "gsconnect@andyholmes.github.io"
          "scroll-workspaces@gfxmonk.net"
          "weatheroclock@CleoMenezesJr.github.io"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "just-perfection-desktop@just-perfection"
          "dash-to-dock@micxgx.gmail.com"
        ];
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "zen.desktop"
          "org.gnome.Calendar.desktop"
          "org.telegram.desktop.desktop"
          "discord.desktop"
          "thunderbird.desktop"
          "obsidian.desktop"
          "code.desktop"
          "kitty.desktop"
          "page.kramo.Cartridges.desktop"
          "steam.desktop"
          "org.gnome.Settings.desktop"
        ];
        # app-picker-layout = [
        #   {
        #     "9849b5ec-f896-4a93-be39-540762c000f3" = {
        #       position = 0;
        #     };
        #   }
        #   {
        #     "ad8b826e-989e-4cc5-aa8d-1cb93b5b8887" = {
        #       position = 1;
        #     };
        #   }
        #   {
        #     "8ca73dad-c018-4278-a087-c8a9f13d85b3" = {
        #       position = 2;
        #     };
        #   }
        #   {
        #     "27c8e1de-f5b4-4824-a8a6-3f55e2f78b91" = {
        #       position = 3;
        #     };
        #   }
        #   {
        #     "15f69ad8-6e63-4248-9ce4-04e146f09a36" = {
        #       position = 4;
        #     };
        #   }
        #   {
        #     "Utilities" = {
        #       position = 5;
        #     };
        #   }
        #   {
        #     "bitwarden.desktop" = {
        #       position = 6;
        #     };
        #   }
        #   {
        #     "com.usebottles.bottles.desktop" = {
        #       position = 7;
        #     };
        #   }
        #   {
        #     "org.gnome.Calculator.desktop" = {
        #       position = 8;
        #     };
        #   }
        #   {
        #     "org.gnome.Snapshot.desktop" = {
        #       position = 9;
        #     };
        #   }
        #   {
        #     "org.gnome.clocks.desktop" = {
        #       position = 10;
        #     };
        #   }
        #   {
        #     "org.gnome.Contacts.desktop" = {
        #       position = 11;
        #     };
        #   }
        #   {
        #     "simple-scan.desktop" = {
        #       position = 12;
        #     };
        #   }
        #   {
        #     "com.mattjakeman.ExtensionManager.desktop" = {
        #       position = 13;
        #     };
        #   }
        #   {
        #     "org.gnome.Extensions.desktop" = {
        #       position = 14;
        #     };
        #   }
        #   {
        #     "com.github.tchx84.Flatseal.desktop" = {
        #       position = 15;
        #     };
        #   }
        #   {
        #     "org.gnome.Maps.desktop" = {
        #       position = 16;
        #     };
        #   }
        #   {
        #     "org.gnome.Music.desktop" = {
        #       position = 17;
        #     };
        #   }
        #   {
        #     "com.obsproject.Studio.desktop" = {
        #       position = 18;
        #     };
        #   }
        #   {
        #     "org.gnome.Software.desktop" = {
        #       position = 19;
        #     };
        #   }
        #   {
        #     "org.gnome.SystemMonitor.desktop" = {
        #       position = 20;
        #     };
        #   }
        #   {
        #     "org.gnome.TextEditor.desktop" = {
        #       position = 21;
        #     };
        #   }
        #   {
        #     "org.gnome.Weather.desktop" = {
        #       position = 22;
        #     };
        #   }
        # ];

      };
      # You need quotes to escape '/'
      "org/gnome/desktop/interface" = {
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
        show-battery-percentage = true;
        font-antialiasing = "rgba";
        font-name = "Inter Variable 11";
        document-font-name = "Inter Variable 11";
        enable-animations = true;
      };

      # Weather and location settings
      "org/gnome/shell/weather" = {
        automatic-location = true;
        locations = [
          "<('Astana', 'UACC', false, [(51.1694, 71.4491)], @a[])>"
        ];
      };
      "org/gnome/system/location" = {
        enabled = true;
      };

      # Console font scaling
      "org/gnome/Console" = {
        font-scale = 2.0;
        last-window-maximised = false;
        last-window-size = "(1292, 888)";
      };

      # GWeather settings
      "org/gnome/GWeather4" = {
        temperature-unit = "centigrade";
      };

      # Calendar
      "org/gnome/calendar" = {
        active-view = "month";
        window-maximized = true;
        window-size = "(768, 600)";
      };

      # Control center panel
      "org/gnome/control-center" = {
        last-panel = "display";
        window-state = "(980, 640, false)";
      };

      # Dash-to-dock extension settings
      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = true;
        background-opacity = 0.8;
        dash-max-icon-size = 64;
        dock-position = "BOTTOM";
        height-fraction = 0.9;
      };

      # App folders configuration
      "org/gnome/desktop/app-folders" = {
        folder-children = [
          "Utilities"
          "YaST"
          "Pardus"
          "ad8b826e-989e-4cc5-aa8d-1cb93b5b8887"
          "27c8e1de-f5b4-4824-a8a6-3f55e2f78b91"
          "15f69ad8-6e63-4248-9ce4-04e146f09a36"
          "8ca73dad-c018-4278-a087-c8a9f13d85b3"
          "9849b5ec-f896-4a93-be39-540762c000f3"
        ];
      };

      # Mutter settings
      "org/gnome/mutter" = {
        center-new-windows = true;
        experimental-features = [ "scale-monitor-framebuffer" ];
      };

      # Notifications configuration
      "org/gnome/desktop/notifications" = {
        application-children = [
          "org-gnome-nautilus"
          "gnome-power-panel"
          "zen"
          "org-gnome-evolution-alarm-notify"
        ];
      };

      # Touchpad configuration
      "org/gnome/desktop/peripherals/touchpad" = {
        two-finger-scrolling-enabled = true;
      };

      # Desktop search providers sorting
      "org/gnome/desktop/search-providers" = {
        sort-order = [
          "org.gnome.Settings.desktop"
          "org.gnome.Contacts.desktop"
          "org.gnome.Nautilus.desktop"
        ];
      };

      # Privacy settings
      "org/gnome/desktop/privacy" = {
        remove-old-temp-files = true;
        remove-old-trash-files = true;
      };

      # Keybindings
      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Alt>q" ];
        switch-input-source = [ "<Control>space" ];
        switch-input-source-backward = [ "<Shift><Control>space" ];
      };

      # Window management preferences
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:close";
        focus-mode = "click";
        mouse-button-modifier = "<Super>";
      };

      # World Clocks - Empty array
      "org/gnome/shell/world-clocks" = {
        locations = [ ];
      };

      # Text editor settings
      # Uncomment if you need custom settings
      # "org/gnome/TextEditor" = {
      #   custom-font = "CaskaydiaCove Nerd Font 15";
      #   highlight-current-line = true;
      #   indent-style = "space";
      #   restore-session = false;
      #   show-grid = false;
      #   show-line-numbers = true;
      #   show-right-margin = false;
      #   style-scheme = "builder-dark";
      #   style-variant = "dark";
      #   tab-width = "uint32 4";
      #   use-system-font = false;
      #   wrap-text = false;
      # };
    };
  };
}
