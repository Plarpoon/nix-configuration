_:

{
  # Additional storage mounts (non-boot-critical)
  # These drives have "nofail" option so system boots even if they're disconnected

  fileSystems = {
    "/mnt/ssd-huge" = {
      device = "/dev/disk/by-uuid/d5dfee8d-2b43-4282-8544-5a5f3314cd95";
      fsType = "btrfs";
      options = [
        "defaults"
        "nofail"
        "compress=zstd" # BTRFS transparent compression
      ];
    };

    "/mnt/ssd-big" = {
      device = "/dev/disk/by-uuid/2dbc264f-9213-4946-9444-dd830ab4fcde";
      fsType = "btrfs";
      options = [
        "defaults"
        "nofail"
        "compress=zstd"
      ];
    };

    #"/mnt/ssd-small" = {
    #  device = "/dev/disk/by-uuid/d3a3c56e-021a-4537-9fec-9f734f8ee7fc";
    #  fsType = "btrfs";
    #  options = [ "defaults" "nofail" "compress=zstd" ];
    #};

    "/mnt/vault" = {
      device = "/dev/disk/by-uuid/9b1fa832-7114-4ed0-a7eb-59bc44c70b03";
      fsType = "btrfs";
      options = [
        "defaults"
        "nofail"
        "compress=zstd"
      ];
    };

    "/mnt/m2" = {
      device = "/dev/disk/by-uuid/694119c6-4b91-414d-94aa-282a2fb15254";
      fsType = "btrfs";
      options = [
        "defaults"
        "nofail"
        "compress=zstd"
      ];
    };

    "/mnt/mega-m2" = {
      device = "/dev/disk/by-uuid/bff0db9f-0b97-4d3c-8f6b-8cbb4ff2ae0e";
      fsType = "btrfs";
      options = [
        "defaults"
        "nofail"
        "compress=zstd"
      ];
    };

    # Windows NTFS partitions (dual-boot support)
    "/mnt/windows1" = {
      device = "/dev/disk/by-uuid/FAA6EE00A6EDBCEF";
      fsType = "ntfs-3g";
      options = [
        "defaults"
        "nofail"
        "uid=1000" # Your user ID
        "gid=100" # users group
        "dmask=022" # Directory permissions
        "fmask=133" # File permissions
      ];
    };

    "/mnt/windows2" = {
      device = "/dev/disk/by-uuid/08A0083AA008312C";
      fsType = "ntfs-3g";
      options = [
        "defaults"
        "nofail"
        "uid=1000"
        "gid=100"
        "dmask=022"
        "fmask=133"
      ];
    };
  };
}
