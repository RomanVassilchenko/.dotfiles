{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    # userSettings = {
    #   "editor.fontFamily" = "'CaskaydiaCove Nerd Font', 'SymbolsNerdFont', 'monospace', monospace";
    #   "terminal.integrated.fontFamily" = "'CaskaydiaCove Nerd Font', 'SymbolsNerdFont'";
    #   "editor.fontSize" = 16;

    #   "explorer.confirmDragAndDrop" = false;

    #   "workbench.startupEditor" = "none";

    #   "workbench.layoutControl.type" = "menu";
    #   "workbench.editor.limit.enabled" = true;
    #   "workbench.editor.limit.value" = 10;
    #   "workbench.editor.limit.perEditorGroup" = true;
    #   "workbench.editor.showTabs" = "single";
    #   "files.autoSave" = "onWindowChange";
    #   "explorer.openEditors.visible" = 0;
    #   "breadcrumbs.enabled" = false;
    #   "editor.renderControlCharacters" = false;
    #   "workbench.activityBar.location" = "hidden";
    #   "workbench.statusBar.visible" = false;
    #   "editor.scrollbar.verticalScrollbarSize" = 2;
    #   "editor.scrollbar.horizontalScrollbarSize" = 2;
    #   "editor.scrollbar.vertical" = "hidden";
    #   "editor.scrollbar.horizontal" = "hidden";
    #   "workbench.layoutControl.enabled" = false;

    #   "editor.mouseWheelZoom" = true;

    #   "C_Cpp.autocompleteAddParentheses" = true;
    #   "C_Cpp.formatting" = "clangFormat";
    #   "C_Cpp.vcFormat.newLine.closeBraceSameLine.emptyFunction" = true;
    #   "C_Cpp.vcFormat.newLine.closeBraceSameLine.emptyType" = true;
    #   "C_Cpp.vcFormat.space.beforeEmptySquareBrackets" = true;
    #   "C_Cpp.vcFormat.newLine.beforeOpenBrace.block" = "sameLine";
    #   "C_Cpp.vcFormat.newLine.beforeOpenBrace.function" = "sameLine";
    #   "C_Cpp.vcFormat.newLine.beforeElse" = false;
    #   "C_Cpp.vcFormat.newLine.beforeCatch" = false;
    #   "C_Cpp.vcFormat.newLine.beforeOpenBrace.type" = "sameLine";
    #   "C_Cpp.vcFormat.space.betweenEmptyBraces" = true;
    #   "C_Cpp.vcFormat.space.betweenEmptyLambdaBrackets" = true;
    #   "C_Cpp.vcFormat.indent.caseLabels" = true;
    #   "C_Cpp.intelliSenseCacheSize" = 2048;
    #   "C_Cpp.intelliSenseMemoryLimit" = 2048;
    #   "C_Cpp.default.browse.path" = [
    #     ''''${workspaceFolder}/**''
    #   ];
    #   "C_Cpp.default.cStandard" = "gnu11";
    #   "C_Cpp.inlayHints.parameterNames.hideLeadingUnderscores" = false;
    #   "C_Cpp.intelliSenseUpdateDelay" = 500;
    #   "C_Cpp.workspaceParsingPriority" = "medium";
    #   "C_Cpp.clang_format_sortIncludes" = true;
    #   "C_Cpp.doxygen.generatedStyle" = "/**";

    # };
    # # Keybindings
    # keybindings = [
    #   {
    #     key = "ctrl+q";
    #     command = "editor.action.commentLine";
    #     when = "editorTextFocus && !editorReadonly";
    #   }
    #   {
    #     key = "ctrl+s";
    #     command = "workbench.action.files.saveFiles";
    #   }
    # ];
  };
}
