{ lib, ... }:

{
  home = {
    username = "plarpoon";
    homeDirectory = lib.mkForce "/Users/plarpoon";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
