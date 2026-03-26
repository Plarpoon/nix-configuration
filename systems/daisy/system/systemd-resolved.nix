_:

{
  # Fallback DNS if systemd-resolved fails
  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
    "8.8.8.8"
    "8.8.4.4"
  ];

  # Primary DNS via systemd-resolved with DNS-over-TLS
  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
      "8.8.8.8#dns.google"
      "8.8.4.4#dns.google"
    ];
    dnsovertls = "true";
  };
}
