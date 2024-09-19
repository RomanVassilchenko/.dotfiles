{ config, pkgs, ... }:

{
  imports = [
    ../shared/home.nix
  ];

  programs.zsh.shellAliases.up = "nh os switch ~/.dotfiles";

  programs.git.userName = "Roman Vassilchenko";
  programs.git.userEmail = "roman.vassilchenko.work@gmail.com";

  home.packages = with pkgs; [
    zsh
  ];

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "Default";
      theme_background = false;
    };
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
        obs-backgroundremoval
    ];
  };

  programs.plasma = {
    shortcuts = {
      "KDE Keyboard Layout Switcher"."Switch keyboard layout to English (US)" = [ ];
      "KDE Keyboard Layout Switcher"."Switch keyboard layout to Russian" = [ ];
      "ksmserver"."Lock Session" = ["Screensaver" "Meta+L" "Ctrl+Alt+Q,Meta+L" "Screensaver,Lock Session"];
      "kwin"."Window Close" = ["Alt+Q" "Alt+F4,Alt+F4,Close Window"];
      "org_kde_powerdevil"."Turn Off Screen" = "Ctrl+Alt+L,none,Turn Off Screen";
      "services/org.kde.spectacle.desktop"."RectangularRegionScreenShot" = ["Meta+Shift+Print" "Alt+%"];
    };

    configFile = {
      "kcminputrc"."Libinput/1267/12717/ELAN2841:00 04F3:31AD Touchpad"."NaturalScroll" = true;
      "kcminputrc"."Mouse"."cursorTheme" = "Breeze_Snow";
      "kdeglobals"."General"."XftHintStyle" = "hintslight";
      "kdeglobals"."General"."XftSubPixel" = "none";
      "kdeglobals"."General"."font" = "Inter Variable,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."General"."menuFont" = "Inter Variable,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."General"."smallestReadableFont" = "Inter Variable,8,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."General"."toolBarFont" = "Inter Variable,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."Icons"."Theme" = "Papirus-Dark";
      "kdeglobals"."WM"."activeBackground" = "49,54,59";
      "kdeglobals"."WM"."activeBlend" = "252,252,252";
      "kdeglobals"."WM"."activeFont" = "Inter Variable,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."WM"."activeForeground" = "252,252,252";
      "kdeglobals"."WM"."inactiveBackground" = "42,46,50";
      "kdeglobals"."WM"."inactiveBlend" = "161,169,177";
      "kdeglobals"."WM"."inactiveForeground" = "161,169,177";
      "ksplashrc"."KSplash"."Theme" = "a2n.kuro";
      "kwinrc"."Xwayland"."Scale" = 1.75;
      "kxkbrc"."Layout"."DisplayNames" = ",";
      "kxkbrc"."Layout"."LayoutList" = "us,ru";
      "kxkbrc"."Layout"."Options" = "grp:ctrl_space_toggle";
      "kxkbrc"."Layout"."ResetOldOptions" = true;
      "kxkbrc"."Layout"."Use" = true;
      "kxkbrc"."Layout"."VariantList" = ",";
    };
  };

  home.stateVersion = "24.05";  # Use the same version as your system.stateVersion
}
