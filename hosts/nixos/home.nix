{ config, pkgs, ... }:

{
  imports = [ ../shared/home.nix ];

  programs.zsh.shellAliases.up = "nh os switch ~/.dotfiles";

  programs.git.userName = "Roman Vassilchenko";
  programs.git.userEmail = "roman.vassilchenko.work@gmail.com";

  home.packages = with pkgs; [ zsh ];

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "Default";
      theme_background = false;
    };
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [ obs-backgroundremoval ];
  };

  programs.plasma = {
    shortcuts = {
      "KDE Keyboard Layout Switcher"."Switch keyboard layout to English (US)" = [ ];
      "KDE Keyboard Layout Switcher"."Switch keyboard layout to Russian" = [ ];
      "ksmserver"."Lock Session" = [
        "Screensaver"
        "Meta+L"
        "Ctrl+Alt+Q,Meta+L"
        "Screensaver,Lock Session"
      ];
      "ksmserver"."LogOut" = "none,,Log Out";
      "kwin"."Window Close" = [
        "Alt+Q"
        "Alt+F4,Alt+F4,Close Window"
      ];
      "org_kde_powerdevil"."Turn Off Screen" = "Ctrl+Alt+L,none,Turn Off Screen";
      "plasmashell"."activate application launcher" = [
        "Meta,Meta"
        "Alt+F1,Activate Application Launcher"
      ];
      "services/org.kde.spectacle.desktop"."RectangularRegionScreenShot" = [
        "Meta+Shift+Print"
        "Alt+%"
      ];
    };
    configFile = {
      "katerc"."General"."Days Meta Infos" = 30;
      "katerc"."General"."Save Meta Infos" = true;
      "katerc"."General"."Show Full Path in Title" = false;
      "katerc"."General"."Show Menu Bar" = true;
      "katerc"."General"."Show Status Bar" = true;
      "katerc"."General"."Show Tab Bar" = true;
      "katerc"."General"."Show Url Nav Bar" = true;
      "katerc"."KTextEditor Renderer"."Animate Bracket Matching" = false;
      "katerc"."KTextEditor Renderer"."Auto Color Theme Selection" = true;
      "katerc"."KTextEditor Renderer"."Color Theme" = "Breeze Dark";
      "katerc"."KTextEditor Renderer"."Line Height Multiplier" = 1;
      "katerc"."KTextEditor Renderer"."Show Indentation Lines" = false;
      "katerc"."KTextEditor Renderer"."Show Whole Bracket Expression" = false;
      "katerc"."KTextEditor Renderer"."Text Font" = "Hack,10,-1,7,400,0,0,0,0,0,0,0,0,0,0,1";
      "katerc"."KTextEditor Renderer"."Word Wrap Marker" = false;
      "katerc"."filetree"."editShade" = "183,220,246";
      "katerc"."filetree"."listMode" = false;
      "katerc"."filetree"."middleClickToClose" = false;
      "katerc"."filetree"."shadingEnabled" = true;
      "katerc"."filetree"."showCloseButton" = false;
      "katerc"."filetree"."showFullPathOnRoots" = false;
      "katerc"."filetree"."showToolbar" = true;
      "katerc"."filetree"."sortRole" = 0;
      "katerc"."filetree"."viewShade" = "211,190,222";
      "kcminputrc"."Libinput/1267/12717/ELAN2841:00 04F3:31AD Touchpad"."NaturalScroll" = true;
      "kcminputrc"."Mouse"."cursorTheme" = "Breeze_Snow";
      "kded5rc"."Module-browserintegrationreminder"."autoload" = false;
      "kdeglobals"."DirSelect Dialog"."DirSelectDialog Size" = "836,569";
      "kdeglobals"."General"."XftHintStyle" = "hintslight";
      "kdeglobals"."General"."XftSubPixel" = "none";
      "kdeglobals"."General"."fixed" = "JetBrainsMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."General"."font" = "Inter Variable,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."General"."menuFont" = "Inter Variable,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."General"."smallestReadableFont" = "Inter Variable,8,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."General"."toolBarFont" = "Inter Variable,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."Icons"."Theme" = "Papirus-Dark";
      "kdeglobals"."KFileDialog Settings"."Allow Expansion" = false;
      "kdeglobals"."KFileDialog Settings"."Automatically select filename extension" = true;
      "kdeglobals"."KFileDialog Settings"."Breadcrumb Navigation" = true;
      "kdeglobals"."KFileDialog Settings"."Decoration position" = 2;
      "kdeglobals"."KFileDialog Settings"."LocationCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."PathCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."Show Bookmarks" = false;
      "kdeglobals"."KFileDialog Settings"."Show Full Path" = false;
      "kdeglobals"."KFileDialog Settings"."Show Inline Previews" = true;
      "kdeglobals"."KFileDialog Settings"."Show Preview" = false;
      "kdeglobals"."KFileDialog Settings"."Show Speedbar" = true;
      "kdeglobals"."KFileDialog Settings"."Show hidden files" = false;
      "kdeglobals"."KFileDialog Settings"."Sort by" = "Name";
      "kdeglobals"."KFileDialog Settings"."Sort directories first" = true;
      "kdeglobals"."KFileDialog Settings"."Sort hidden files last" = false;
      "kdeglobals"."KFileDialog Settings"."Sort reversed" = false;
      "kdeglobals"."KFileDialog Settings"."Speedbar Width" = 141;
      "kdeglobals"."KFileDialog Settings"."View Style" = "DetailTree";
      "kdeglobals"."WM"."activeBackground" = "49,54,59";
      "kdeglobals"."WM"."activeBlend" = "252,252,252";
      "kdeglobals"."WM"."activeFont" = "Inter Variable,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."WM"."activeForeground" = "252,252,252";
      "kdeglobals"."WM"."inactiveBackground" = "42,46,50";
      "kdeglobals"."WM"."inactiveBlend" = "161,169,177";
      "kdeglobals"."WM"."inactiveForeground" = "161,169,177";
      "ksplashrc"."KSplash"."Theme" = "a2n.kuro";
      "kwinrc"."Plugins"."maximized-window-gapsEnabled" = true;
      "kwinrc"."Script-maximized-window-gaps"."gapBottom" = 11;
      "kwinrc"."Script-maximized-window-gaps"."gapLeft" = 13;
      "kwinrc"."Script-maximized-window-gaps"."gapRight" = 13;
      "kwinrc"."Script-maximized-window-gaps"."gapTop" = 18;
      "kwinrc"."Tiling/807efb6e-5953-5f33-ad65-6c9c22af6398"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kxkbrc"."Layout"."DisplayNames" = ",";
      "kxkbrc"."Layout"."LayoutList" = "us,ru";
      "kxkbrc"."Layout"."Options" = "grp:ctrl_space_toggle";
      "kxkbrc"."Layout"."ResetOldOptions" = true;
      "kxkbrc"."Layout"."Use" = true;
      "kxkbrc"."Layout"."VariantList" = ",";
      "plasmanotifyrc"."Applications/org.telegram.desktop"."Seen" = true;
      "plasmanotifyrc"."Applications/vesktop"."Seen" = true;
    };
  };

  home.stateVersion = "24.05"; # Use the same version as your system.stateVersion
}
