_:

{
  boot.loader.grub = {
    enable = true;
    device = "nodev"; # for UEFI
    efiSupport = true;
    useOSProber = true;
    gfxmodeEfi = "2560x1440";
  };
}
