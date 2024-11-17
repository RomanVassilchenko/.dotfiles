{ ... }:
{
  system = {
    stateVersion = 4;
    defaults = {
      menuExtraClock.Show24Hour = true;

      dock = {
        enable-spring-load-actions-on-all-items = true;
        mouse-over-hilite-stack = true;
        autohide = true;
        autohide-delay = 0.0;
        orientation = "bottom";
        show-recents = false;
        showhidden = true;
        mru-spaces = false;
        expose-group-by-app = true;
        tilesize = 64;
        show-process-indicators = true;
        expose-animation-duration = 0.1;
        launchanim = false;
        mineffect = "scale";

        wvous-tl-corner = 2; # top-left - Mission Control
        # wvous-tr-corner = 4; # top-right - Desktop
        # wvous-bl-corner = 3; # bottom-left - Application Windows
        # wvous-br-corner = 13; # bottom-right - Lock Screen
      };

      finder = {
        _FXShowPosixPathInTitle = true; # show full path in finder title
        AppleShowAllExtensions = true; # show all file extensions
        FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
        FXPreferredViewStyle = "Nlsv";
        AppleShowAllFiles = true;
      };

      # customize trackpad
      trackpad = {
        # tap - 轻触触摸板, click - 点击触摸板
        Clicking = true; # enable tap to click(轻触触摸板相当于点击)
        TrackpadRightClick = true; # enable two finger right click
        TrackpadThreeFingerDrag = true; # enable three finger drag
      };

      # customize macOS
      NSGlobalDomain = {
        # `defaults read NSGlobalDomain "xxx"`
        "com.apple.swipescrolldirection" = true; # enable natural scrolling(default to true)
        # "com.apple.sound.beep.feedback" = 0; # disable beep sound when pressing volume up/down key

        # Appearance
        AppleInterfaceStyle = "Dark";

        AppleKeyboardUIMode = 3; # Mode 3 enables full keyboard control.
        # ApplePressAndHoldEnabled = true; # enable press and hold

        # If you press and hold certain keyboard keys when in a text area, the key’s character begins to repeat.
        # This is very useful for vim users, they use `hjkl` to move cursor.
        # sets how long it takes before it starts repeating.
        # InitialKeyRepeat = 15; # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        # sets how fast it repeats once it starts.
        # KeyRepeat = 3; # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

        NSAutomaticCapitalizationEnabled = false; # disable auto capitalization(自动大写)
        NSAutomaticDashSubstitutionEnabled = false; # disable auto dash substitution(智能破折号替换)
        NSAutomaticPeriodSubstitutionEnabled = false; # disable auto period substitution(智能句号替换)
        NSAutomaticQuoteSubstitutionEnabled = false; # disable auto quote substitution(智能引号替换)
        NSAutomaticSpellingCorrectionEnabled = false; # disable auto spelling correction(自动拼写检查)
        NSNavPanelExpandedStateForSaveMode = true; # expand save panel by default(保存文件时的路径选择/文件名输入页)
        NSNavPanelExpandedStateForSaveMode2 = true;

        ApplePressAndHoldEnabled = false;
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        AppleShowScrollBars = "Always";
        NSWindowResizeTime = 0.1;
        NSDocumentSaveNewDocumentsToCloud = false;
        _HIHideMenuBar = false;
        "com.apple.springing.delay" = 0.0;
      };

      # customize settings that not supported by nix-darwin directly
      # Incomplete list of macOS `defaults` commands :
      #   https://github.com/yannbertrand/macos-defaults
      CustomUserPreferences = {
        ".GlobalPreferences" = {
          # automatically switch to a new space when switching to the application
          AppleSpacesSwitchOnActivate = true;
        };
        NSGlobalDomain = {
          WebKitDeveloperExtras = true;
          NSNavPanelExpandedStateForSaveMode = true;
          NSTableViewDefaultSizeMode = 1;
        };
        "com.apple.finder" = {
          AppleShowAllFiles = true;
          ShowExternalHardDrivesOnDesktop = false;
          ShowHardDrivesOnDesktop = false;
          ShowMountedServersOnDesktop = false;
          ShowRemovableMediaOnDesktop = false;
          _FXSortFoldersFirst = true;
          # When performing a search, search the current folder by default
          FXDefaultSearchScope = "SCcf";
        };
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.spaces" = {
          # Display have separate spaces
          #   true => disable this feature
          #   false => enable this feature
          "spans-displays" = true;
        };
        "com.apple.WindowManager" = {
          EnableStandardClickToShowDesktop = 0; # Click wallpaper to reveal desktop
          StandardHideDesktopIcons = 0; # Show items on desktop
          HideDesktop = 0; # Do not hide items on desktop & stage manager
          StageManagerHideWidgets = 0;
          StandardHideWidgets = 0;
        };
        # "com.apple.screensaver" = {
        #   # Require password immediately after sleep or screen saver begins
        #   askForPassword = 1;
        #   askForPasswordDelay = 0;
        # };
        "com.apple.screencapture" = {
          location = "~/Desktop";
          type = "png";
        };
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        "com.apple.ImageCapture".disableHotPlug = true;

        # "com.apple.NetworkBrowser" = { BrowseAllInterfaces = true; };
        # "com.apple.screensaver" = {
        #   askForPassword = true;
        #   askForPasswordDelay = 0;
        # };
        "com.apple.trackpad" = {
          scaling = 2;
        };
        "com.apple.mouse" = {
          scaling = 2.5;
        };
        # "com.apple.desktopservices" = { DSDontWriteNetworkStores = false; };
        # "com.apple.LaunchServices" = { LSQuarantine = true; };
        "com.apple.finder" = {
          WarnOnEmptyTrash = false;
        };

        "com.apple.mail" = {
          DisableReplyAnimations = true;
          DisableSendAnimations = true;
          DisableInlineAttachmentViewing = true;
          AddressesIncludeNameOnPasteboard = true;
          InboxViewerAttributes = {
            DisplayInThreadedMode = "yes";
            SortedDescending = "yes";
            SortOrder = "received-date";
          };
          NSUserKeyEquivalents = {
            Send = "@\U21a9";
            Archive = "@$e";
          };
        };

        "com.apple.dock" = {
          size-immutable = true;
        };
        # "com.apple.Safari" = {
        #   IncludeInternalDebugMenu = true;
        #   IncludeDevelopMenu = true;
        #   WebKitDeveloperExtrasEnabledPreferenceKey = true;
        #   ShowFullURLInSmartSearchField = true;
        #   AutoOpenSafeDownloads = false;
        #   HomePage = "";
        #   AutoFillCreditCardData = false;
        #   AutoFillFromAddressBook = false;
        #   AutoFillMiscellaneousForms = false;
        #   AutoFillPasswords = false;
        #   "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" = true;
        #   AlwaysRestoreSessionAtLaunch = 1;
        #   ExcludePrivateWindowWhenRestoringSessionAtLaunch = 1;
        #   ShowBackgroundImageInFavorites = 0;
        #   ShowFrequentlyVisitedSites = 1;
        #   ShowHighlightsInFavorites = 1;
        #   ShowPrivacyReportInFavorites = 1;
        #   ShowRecentlyClosedTabsPreferenceKey = 1;
        # };
      };

      # loginwindow = {
      #   GuestEnabled = false; # disable guest user
      #   SHOWFULLNAME = true; # show full name in login window
      # };
    };

    # keyboard settings is not very useful on macOS
    # the most important thing is to remap option key to alt key globally,
    # but it's not supported by macOS yet.
    keyboard = {
      # enableKeyMapping = true; # enable key mapping so that we can use `option` as `control`

      # NOTE: do NOT support remap capslock to both control and escape at the same time
      # remapCapsLockToControl = false; # remap caps lock to control, useful for emac users
      # remapCapsLockToEscape = true; # remap caps lock to escape, useful for vim users

      # swap left command and left alt
      # so it matches common keyboard layout: `ctrl | command | alt`
      #
      # disabled, caused only problems!
      # swapLeftCommandAndLeftAlt = false;

      # userKeyMapping = [
      #   # remap escape to caps lock
      #   # so we swap caps lock and escape, then we can use caps lock as escape
      #   {
      #     HIDKeyboardModifierMappingSrc = 30064771113;
      #     HIDKeyboardModifierMappingDst = 30064771129;
      #   }
      # ];
    };
  };
}
