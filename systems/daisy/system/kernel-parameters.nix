_:

{
  # Intel I225-V ethernet controller hardware bug workaround:
  # Disable "CPU PCIE ASPM Mode Control" under Advanced → Onboard Devices Configuration
  # The I225-V has silicon bugs affecting PCIe power management (ASPM).
  # EEE is already disabled by default in the igc driver.

  boot.kernelParams = [
    "amdgpu.gpu_recovery=1"
  ];
}
