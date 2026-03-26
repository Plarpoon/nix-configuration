_:

{
  networking.nftables.enable = true;

  networking.firewall = {
    enable = true;
    backend = "firewalld";
  };

  services.firewalld.enable = true;
}
