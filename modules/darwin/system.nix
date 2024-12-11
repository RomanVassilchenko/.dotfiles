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
        expose-group-apps = true;
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
        _FXShowPosixPathInTitle = true;
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        # FXPreferredViewStyle = "Nlsv";
        AppleShowAllFiles = true;
      };

      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = true;
      };

      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = true;
        "com.apple.sound.beep.feedback" = 0;

        AppleInterfaceStyle = "Dark";

        AppleKeyboardUIMode = 3;
        # ApplePressAndHoldEnabled = true; # enable press and hold

        # If you press and hold certain keyboard keys when in a text area, the key’s character begins to repeat.
        # This is very useful for vim users, they use `hjkl` to move cursor.
        # sets how long it takes before it starts repeating.
        # InitialKeyRepeat = 15; # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        # sets how fast it repeats once it starts.
        # KeyRepeat = 3; # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
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
          AppleSpacesSwitchOnActivate = true;
        };
        NSGlobalDomain = {
          WebKitDeveloperExtras = true;
          NSNavPanelExpandedStateForSaveMode = true;
          NSTableViewDefaultSizeMode = 2;
        };
        "com.apple.finder" = {
          AppleShowAllFiles = true;
          ShowExternalHardDrivesOnDesktop = false;
          ShowHardDrivesOnDesktop = false;
          ShowMountedServersOnDesktop = false;
          ShowRemovableMediaOnDesktop = false;
          _FXSortFoldersFirst = true;
          FXDefaultSearchScope = "SCcf";
        };
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.spaces" = {
          "spans-displays" = true;
        };
        "com.apple.WindowManager" = {
          EnableStandardClickToShowDesktop = 0;
          StandardHideDesktopIcons = 0;
          HideDesktop = 0;
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
        "com.apple.LaunchServices" = {
          LSQuarantine = true;
        };
        "com.apple.finder" = {
          WarnOnEmptyTrash = false;
        };

        # "com.apple.mail" = {
        #   DisableReplyAnimations = true;
        #   DisableSendAnimations = true;
        #   DisableInlineAttachmentViewing = true;
        #   AddressesIncludeNameOnPasteboard = true;
        #   InboxViewerAttributes = {
        #     DisplayInThreadedMode = "yes";
        #     SortedDescending = "yes";
        #     SortOrder = "received-date";
        #   };
        #   NSUserKeyEquivalents = {
        #     Send = "@\U21a9";
        #     Archive = "@$e";
        #   };
        # };

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
