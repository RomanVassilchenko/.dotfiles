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
    ]
  );

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
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

      };
      "org/gnome/desktop/interface" = {
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
        show-battery-percentage = true;
        font-antialiasing = "rgba";
        font-name = "Inter Variable 11";
        document-font-name = "Inter Variable 11";
        enable-animations = true;
      };

      "org/gnome/shell/weather" = {
        automatic-location = true;
        locations = [
          "<('Astana', 'UACC', false, [(51.1694, 71.4491)], @a[])>"
        ];
      };
      "org/gnome/system/location" = {
        enabled = true;
      };

      "org/gnome/Console" = {
        font-scale = 2.0;
        last-window-maximised = false;
        last-window-size = "(1292, 888)";
      };

      "org/gnome/GWeather4" = {
        temperature-unit = "centigrade";
      };

      "org/gnome/calendar" = {
        active-view = "month";
        window-maximized = true;
        window-size = "(768, 600)";
      };

      "org/gnome/control-center" = {
        last-panel = "display";
        window-state = "(980, 640, false)";
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = true;
        background-opacity = 0.8;
        dash-max-icon-size = 64;
        dock-position = "BOTTOM";
        height-fraction = 0.9;
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

      "org/gnome/mutter" = {
        center-new-windows = true;
        experimental-features = [ "scale-monitor-framebuffer" ];
      };

      "org/gnome/desktop/notifications" = {
        application-children = [
          "org-gnome-nautilus"
          "gnome-power-panel"
          "zen"
          "org-gnome-evolution-alarm-notify"
        ];
      };

      "org/gnome/desktop/peripherals/touchpad" = {
        two-finger-scrolling-enabled = true;
      };

      "org/gnome/desktop/search-providers" = {
        sort-order = [
          "org.gnome.Settings.desktop"
          "org.gnome.Contacts.desktop"
          "org.gnome.Nautilus.desktop"
        ];
      };

      "org/gnome/desktop/privacy" = {
        remove-old-temp-files = true;
        remove-old-trash-files = true;
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Alt>q" ];
        switch-input-source = [ "<Control>space" ];
        switch-input-source-backward = [ "<Shift><Control>space" ];
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:close";
        focus-mode = "click";
        mouse-button-modifier = "<Super>";
      };

      "org/gnome/shell/world-clocks" = {
        locations = [ ];
      };
    };
  };
}
