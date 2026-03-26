{ pkgs, ... }:

{
  # Define the primary user of the system
  system.primaryUser = "plarpoon";

  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System-level shell
  environment.shells = [ pkgs.nushell ];

  # Set default shell for the user
  users.users.plarpoon = {
    shell = pkgs.nushell;
  };

  # Time zone
  time.timeZone = "Europe/Stockholm";

  system.stateVersion = 6;

  # Enable Touch ID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;
}
