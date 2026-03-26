_:

{
  services = {
    # Enable COSMIC desktop environment
    desktopManager.cosmic.enable = true;

    # Enable Cosmic Greeter
    # Currently disabled as I am using SDDM
    # displayManager.cosmic-greeter.enable = true;

    # System76 scheduler
    # Disabled as it would interfere with KDE's power management
    # system76-scheduler.enable = true;
  };

  # COSMIC-specific packages
  # environment.systemPackages = with pkgs; [
  #  ...
  # ];
}
