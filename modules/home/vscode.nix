{ pkgs, ... }:
let
  jonathanharty.gruvbox-material-icon-theme = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "gruvbox-material-icon-theme";
      publisher = "JonathanHarty";
      version = "1.1.5";
      hash = "sha256-86UWUuWKT6adx4hw4OJw3cSZxWZKLH4uLTO+Ssg75gY=";
    };
  };
in
# sainnhe.gruvbox-material = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
#   mktplcRef = {
#     name = "gruvbox-material";
#     publisher = "sainnhe";
#     version = "6.5.2";
#     hash = "sha256-D+SZEQQwjZeuyENOYBJGn8tqS3cJiWbEkmEqhNRY/i4=";
#   };
# };
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      # nix language
      bbenoist.nix
      # nix-shell suport 
      arrterian.nix-env-selector
      # python
      ms-python.python
      # C/C++
      ms-vscode.cpptools
      # OCaml
      ocamllabs.ocaml-platform

      # amodio.toggle-excluded-files
      ban.spellright
      davidanson.vscode-markdownlint
      donjayamanne.githistory
      eamodio.gitlens
      formulahendry.code-runner
      # galkowskit.go-interface-annotations
      # github.copilot
      # github.copilot-chat
      golang.go
      gruntfuggly.todo-tree
      # honnamkuan.golang-snippets
      jbockle.jbockle-format-files
      jnoortheen.nix-ide
      mechatroner.rainbow-csv
      ms-azuretools.vscode-docker
      ms-kubernetes-tools.vscode-kubernetes-tools
      ms-python.debugpy
      ms-python.python
      # ms-python.vscode-pylance
      ms-vscode-remote.remote-containers
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      # ms-vscode.cpptools
      # ms-vscode.remote-explorer
      # mtxr.sqltools
      # mtxr.sqltools-driver-pg
      naumovs.color-highlight
      # neonxp.gotools
      pkief.material-icon-theme
      # premparihar.gotestexplorer
      quicktype.quicktype
      redhat.vscode-yaml
      # semanticdiff.semanticdiff
      # supermaven.supermaven
      # tylim88.folder-hide
      usernamehw.errorlens
      # vscodevim.vim
      vspacecode.whichkey
      zxh404.vscode-proto3

      # Color theme
      jdinhlife.gruvbox
      # sainnhe.gruvbox-material
      jonathanharty.gruvbox-material-icon-theme
    ];
    userSettings = {
      "update.mode" = "none";
      "extensions.autoUpdate" = false; # This stuff fixes vscode freaking out when theres an update
      "window.titleBarStyle" = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509

      "window.menuBarVisibility" = "toggle";
      "editor.fontFamily" = "'CaskaydiaCove Nerd Font', 'SymbolsNerdFont', 'monospace', monospace";
      "terminal.integrated.fontFamily" = "'CaskaydiaCove Nerd Font', 'SymbolsNerdFont'";
      "editor.fontSize" = 16;
      "workbench.colorTheme" = "Gruvbox Dark Hard";
      "workbench.iconTheme" = "gruvbox-material-icon-theme";
      "material-icon-theme.folders.theme" = "classic";
      "vsicons.dontShowNewVersionMessage" = true;
      "explorer.confirmDragAndDrop" = false;
      "editor.fontLigatures" = true;
      "editor.minimap.enabled" = false;
      "workbench.startupEditor" = "none";

      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.formatOnPaste" = true;

      "workbench.layoutControl.type" = "menu";
      "workbench.editor.limit.enabled" = true;
      "workbench.editor.limit.value" = 10;
      "workbench.editor.limit.perEditorGroup" = true;
      "workbench.editor.showTabs" = "single";
      "files.autoSave" = "onWindowChange";
      "explorer.openEditors.visible" = 0;
      "breadcrumbs.enabled" = false;
      "editor.renderControlCharacters" = false;
      "workbench.activityBar.location" = "hidden";
      "workbench.statusBar.visible" = false;
      "editor.scrollbar.verticalScrollbarSize" = 2;
      "editor.scrollbar.horizontalScrollbarSize" = 2;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.horizontal" = "hidden";
      "workbench.layoutControl.enabled" = false;

      "editor.mouseWheelZoom" = true;

      "C_Cpp.autocompleteAddParentheses" = true;
      "C_Cpp.formatting" = "clangFormat";
      "C_Cpp.vcFormat.newLine.closeBraceSameLine.emptyFunction" = true;
      "C_Cpp.vcFormat.newLine.closeBraceSameLine.emptyType" = true;
      "C_Cpp.vcFormat.space.beforeEmptySquareBrackets" = true;
      "C_Cpp.vcFormat.newLine.beforeOpenBrace.block" = "sameLine";
      "C_Cpp.vcFormat.newLine.beforeOpenBrace.function" = "sameLine";
      "C_Cpp.vcFormat.newLine.beforeElse" = false;
      "C_Cpp.vcFormat.newLine.beforeCatch" = false;
      "C_Cpp.vcFormat.newLine.beforeOpenBrace.type" = "sameLine";
      "C_Cpp.vcFormat.space.betweenEmptyBraces" = true;
      "C_Cpp.vcFormat.space.betweenEmptyLambdaBrackets" = true;
      "C_Cpp.vcFormat.indent.caseLabels" = true;
      "C_Cpp.intelliSenseCacheSize" = 2048;
      "C_Cpp.intelliSenseMemoryLimit" = 2048;
      "C_Cpp.default.browse.path" = [
        ''''${workspaceFolder}/**''
      ];
      "C_Cpp.default.cStandard" = "gnu11";
      "C_Cpp.inlayHints.parameterNames.hideLeadingUnderscores" = false;
      "C_Cpp.intelliSenseUpdateDelay" = 500;
      "C_Cpp.workspaceParsingPriority" = "medium";
      "C_Cpp.clang_format_sortIncludes" = true;
      "C_Cpp.doxygen.generatedStyle" = "/**";
      "nix.serverPath" = "nixd";
      "nix.enableLanguageServer" = true;

    };
    # Keybindings
    keybindings = [
      {
        key = "ctrl+q";
        command = "editor.action.commentLine";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+s";
        command = "workbench.action.files.saveFiles";
      }
    ];
  };
}
