{ config, lib, pkgs, modulesPath, ... }:

{

 imports =
  [ (modulesPath + "/installer/scan/not-detected.nix") ];

 boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc" ];
 boot.initrd.kernelModules = [ ];
 boot.kernelModules = [ "kvm-amd" ];
 boot.extraModulePackages = [ ];
 boot.kernelParams = [ "amdgpu.dcdebugmask=0x10" ];

 services.xserver.videoDrivers = [ "amdgpu" ];

 hardware.graphics = {
  enable = true;
  enable32Bit = true;
 };

 services.tlp = {
  enable = true;
  settings = {
   CPU_SCALING_GOVERNOR_ON_AC = "performance";
   CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
   CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
   CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
   CPU_MIN_PERF_ON_AC = 0;
   CPU_MAX_PERF_ON_AC = 100;
   CPU_MIN_PERF_ON_BAT = 0;
   CPU_MAX_PERF_ON_BAT = 20;
  };
 };

 fileSystems."/" =
  { device = "/dev/disk/by-uuid/206bb9cc-09b7-4f14-9ae6-676f6814d0e0";
    fsType = "ext4";
  };

 fileSystems."/boot" =
  { device = "/dev/disk/by-uuid/4EE4-0FCA";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

 swapDevices =
  [ { device = "/dev/disk/by-uuid/db2afda3-a63e-47fe-9c1e-0398d018ec11"; } ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}
