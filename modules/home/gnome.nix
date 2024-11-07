{ pkgs, ... }:
{

  fonts.fontconfig.enable = true;
  home.packages = (
    with pkgs;
    [
      gnome-tweaks
      inter
      gnome-extension-manager
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

      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = true;
        background-opacity = 0.8;
        dash-max-icon-size = 64;
        dock-position = "BOTTOM";
        height-fraction = 0.9;
      };

      # Configure individual extensions
      # "org/gnome/shell/extensions/blur-my-shell" = {
      #   brightness = 0.75;
      #   noise-amount = 0;
      # };
    };
  };

  # dconf.settings = {
  #   "org/gnome/TextEditor" = {
  #     custom-font = "CaskaydiaCove Nerd Font 15";
  #     highlight-current-line = true;
  #     indent-style = "space";
  #     restore-session = false;
  #     show-grid = false;
  #     show-line-numbers = true;
  #     show-right-margin = false;
  #     style-scheme = "builder-dark";
  #     style-variant = "dark";
  #     tab-width = "uint32 4";
  #     use-system-font = false;
  #     wrap-text = false;
  #   };
  # };
}
