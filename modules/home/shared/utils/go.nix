{ pkgs, ... }:
{
  programs.go = {
    enable = true;
    package = pkgs.go;
  };

  home.packages = (
    with pkgs;
    [
      gotools
      gofumpt
      golines
      golangci-lint
      govulncheck
      gomodifytags
      iferr
      impl
      reftools
      ginkgo
      richgo
      gotestsum
    ]
  );
}