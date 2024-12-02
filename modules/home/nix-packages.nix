{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      ani-cli
      bitwarden-desktop
      binsider
      bitwise
      caligula
      dbeaver-bin
      dconf-editor
      docfd
      entr
      gdb
      gifsicle
      gtt
      hexdump
      libreoffice
      nitch
      nix-prefetch-github
      openvpn3
      telegram-desktop
      # thunderbird
      tdf
      tpm2-tss
      valgrind
    ]
  );
}
