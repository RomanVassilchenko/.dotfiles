{
  programs.micro = {
    enable = true;

    settings = {
      "colorscheme" = "vscode-dark";
      "*.nix" = {
        "tabsize" = 2;
      };
      "*.ml" = {
        "tabsize" = 2;
      };
      "*.sh" = {
        "tabsize" = 2;
      };
      "makefile" = {
        "tabstospaces" = false;
      };
      "tabstospaces" = true;
      "tabsize" = 4;
      "mkparents" = true;
      "colorcolumn" = 80;
    };
  };

  xdg.configFile."micro/bindings.json".text = ''
    {
      "Ctrl-Up": "CursorUp,CursorUp,CursorUp,CursorUp,CursorUp",
      "Ctrl-Down": "CursorDown,CursorDown,CursorDown,CursorDown,CursorDown",
      "Ctrl-Backspace": "DeleteWordLeft",
      "Ctrl-Delete": "DeleteWordRight",
      "CtrlShiftUp": "ScrollUp,ScrollUp,ScrollUp,ScrollUp,ScrollUp",
      "CtrlShiftDown": "ScrollDown,ScrollDown,ScrollDown,ScrollDown,ScrollDown"
    }
  '';

  xdg.configFile."micro/colorschemes/vscode-dark.micro".text = ''
    color-link default "#D4D4D4"            # Default text
    color-link comment "#6A9955"           # Comments
    color-link constant "#CE9178"          # Constants
    color-link constant.string "#D69D85"   # Strings
    color-link constant.string.char "#D69D85" # Character strings
    color-link identifier "#9CDCFE"        # Identifiers
    color-link statement "#569CD6"         # Statements (e.g., keywords)
    color-link preproc "#C586C0"           # Preprocessor
    color-link type "#4EC9B0"              # Types
    color-link special "#C586C0"           # Special keywords
    color-link underlined "underline #D4D4D4" # Underlined
    color-link error "#F44747"             # Errors
    color-link hlsearch "#264F78,#569CD6"  # Search highlights
    color-link diff-added "#587C0C"        # Diff added
    color-link diff-modified "#0C7D9D"     # Diff modified
    color-link diff-deleted "#A31515"      # Diff deleted
    color-link gutter-error "#F44747"      # Gutter errors
    color-link gutter-warning "#CCA700"    # Gutter warnings
    color-link line-number "#858585"       # Line numbers
    color-link current-line-number "#D4D4D4" # Current line number
    color-link cursor-line "#2D2D2D"       # Cursor line
    color-link color-column "#858585"      # Color column
    color-link statusline "#007ACC"        # Status line
    color-link tabbar "#252526,#3C3C3C"    # Tab bar
    color-link todo "#FFD700"              # TODO items
  '';
}
