{ pkgs, ... }:

{
  # Define the primary user of the system
  system = {
    primaryUser = "plarpoon";
    stateVersion = 6;

    # Rust update script
    activationScripts.postActivation.text = ''
      echo "Updating rust toolchains..." >&2
      ${pkgs.rustup}/bin/rustup update
    '';
  };

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

  # Enable Touch ID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

}
