_:

{
  services = {
    # OpenSSH server on non-standard port
    openssh = {
      enable = true;
      ports = [ 2345 ]; # Changed from 22 to avoid conflict with endlessh
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };

    # Fail2ban for brute force protection
    fail2ban = {
      enable = true;
      maxretry = 5;
      ignoreIP = [
        "192.168.3.0/24"
      ];
    };

    # Endlessh tarpit on port 22 to trap bots
    endlessh = {
      enable = true;
      port = 22; # Endlessh gets the standard SSH port
      openFirewall = true;
    };
  };

  # Open firewall for real SSH port
  networking.firewall.allowedTCPPorts = [ 2345 ];
}
