{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Nix
    nixd
    nixfmt-rfc-style
    nix-index
    statix

    # Shell
    alacritty
    fastfetch
    starship

    # Compression
    lzop
    p7zip
    unrar
    unzip
    unar
    zip

    # Development Tools
    gh
    direnv
  ];
}
