{ ... }:
{
  programs.fzf = {
    enable = true;

    enableZshIntegration = true;

    defaultCommand = "fd --hidden --strip-cwd-prefix --exclude .git";
    fileWidgetOptions = [
      "--preview 'if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi'"
    ];
    changeDirWidgetCommand = "fd --type=d --hidden --strip-cwd-prefix --exclude .git";
    changeDirWidgetOptions = [ "--preview 'eza --tree --color=always {} | head -200'" ];

    # Theme settings for VS Code Dark+ look
    defaultOptions = [
      "--color=fg:#D4D4D4,bg:#1E1E1E,fg+:#FFFFFF,bg+:#3A3D41"
      "--color=hl:#569CD6,hl+:#9CDCFE,info:#C586C0,marker:#D7BA7D"
      "--color=prompt:#CE9178,spinner:#C586C0,pointer:#D7BA7D,header:#007ACC"
      "--color=border:#3C3C3C,label:#AEAFAD,query:#CE9178"
      "--border='rounded' --preview-window='border-rounded' --prompt='> '"
      "--marker='>' --pointer='>' --separator='─' --scrollbar='│'"
      "--info='right'"
    ];
  };
}
