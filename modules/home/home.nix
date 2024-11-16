{ ... }:
{
  programs.home-manager.enable = true;
  programs.nix-index.enable = true;

  home.sessionVariables = {
    PROJECTS = "$HOME/Development";
  };

  home.activation.developer = ''
    mkdir -p ~/Development
  '';
}
