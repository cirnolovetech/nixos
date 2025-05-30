{ config, lib, pkgs, modulesPath, ... }:

{

 imports =
  [ (modulesPath + "/installer/scan/not-detected.nix") ];

 boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "rtsx_pci_sdmmc" ];
 boot.initrd.kernelModules = [ ];
 boot.kernelModules = [ "kvm-amd" ];
 boot.extraModulePackages = [ ];

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
