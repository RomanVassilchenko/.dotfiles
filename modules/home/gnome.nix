{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
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
        ];

        # You need quotes to escape '/'
        # "org/gnome/desktop/interface" = {
        #   clock-show-weekday = true;
        # };

        # "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      };

      # Configure individual extensions
      "org/gnome/shell/extensions/blur-my-shell" = {
        brightness = 0.75;
        noise-amount = 0;
      };
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
