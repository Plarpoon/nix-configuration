_:

{
  networking.hostName = "daisy";

  services.tailscale = {
    enable = true;
    openFirewall = true;

    # This allows using Tailscale without root privileges.
    extraUpFlags = [
      "--operator=plarpoon"
    ];
  };
}
