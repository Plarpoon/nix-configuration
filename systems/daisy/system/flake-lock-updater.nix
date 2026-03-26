_:

{
  # this just updates the flake.lock file and not the actual system itself
  system.autoUpgrade = {
    enable = true;
    flake = "/home/plarpoon/nixos-config#daisy";
    flags = [
      "--update-input"
      "nixpkgs"
      "--commit-lock-file"
    ];
    dates = "daily";
    allowReboot = false;
  };
}
