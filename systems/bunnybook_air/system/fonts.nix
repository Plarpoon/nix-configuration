{ pkgs, lib, ... }:

{
  fonts.packages =
    (builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts))
    ++ (with pkgs; [
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
    ]);
}
