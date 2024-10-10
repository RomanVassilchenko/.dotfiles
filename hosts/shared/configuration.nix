{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.alacritty
    # pkgs.air
    # pkgs.awscli
    # pkgs.bun
    pkgs.ffmpeg
    # pkgs.git
    # pkgs.gh
    pkgs.gnupg
    # pkgs.iperf
    # pkgs.lua-language-server
    pkgs.mkalias
    # pkgs.neovim
    # pkgs.nil
    # pkgs.obsidian
    # pkgs.opentofu
    # pkgs.pass
    # pkgs.postgresql_16
    # pkgs.rclone
    # pkgs.ripgrep
    # pkgs.rustup
    # pkgs.stylua
    # pkgs.unstable.stripe-cli
    # pkgs.tailwindcss
    # pkgs.tailwindcss-language-server
    # pkgs.templ
    pkgs.tmux
    pkgs.nixfmt-rfc-style
    # pkgs.unstable.amber-lang
    pkgs.zoxide
  ];
}
