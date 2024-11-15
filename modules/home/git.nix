{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "Roman Vassilchenko";
    userEmail = "roman.vassilchenko.work@gmail.com";

    aliases = {
      ga = "add";
      gaa = "add --all";
      gs = "status";
      gb = "branch";
      gm = "merge";
      gd = "diff";
      gpl = "pull";
      gplo = "pull origin";
      gps = "push";
      gpso = "push origin";
      gpst = "push --follow-tags";
      gcl = "clone";
      gc = "commit";
      gcm = "commit -m";
      gcma = "add --all && git commit -m";
      gtag = "tag -ma";
      gch = "checkout";
      gchb = "checkout -b";
      glog = "log --oneline --decorate --graph";
      glol = "log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'";
      glola = "log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all";
      glols = "log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat";
    };

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      lfs = {
        enable = true;
      };

      core = {
        editor = "nvim";
        compression = -1;
        autocrlf = "input";
        whitespace = "trailing-space,space-before-tab";
        precomposeunicode = true;
      };
      color = {
        diff = "auto";
        status = "auto";
        branch = "auto";
        ui = true;
      };
      advice = {
        addEmptyPathspec = false;
      };
      apply = {
        whitespace = "nowarn";
      };
      help = {
        autocorrect = 1;
      };
      grep = {
        extendRegexp = true;
        lineNumber = true;
      };
      push = {
        autoSetupRemote = true;
        default = "simple";
      };
      submodule = {
        fetchJobs = 4;
      };
      log = {
        showSignature = false;
      };
      format = {
        signOff = true;
      };
      rerere = {
        enabled = true;
      };
      pull = {
        ff = "only";
      };
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
        diff-so-fancy = true;
        navigate = true;
      };
    };
  };

  home.packages = [ pkgs.gh ];
  programs.zsh.shellAliases = {
    g = "lazygit";
    gf = "onefetch --number-of-file-churns 0 --no-color-palette";
  };
}
