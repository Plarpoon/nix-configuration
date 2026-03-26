{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Nix
    nil
    nixfmt-rfc-style
    nix-index

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
