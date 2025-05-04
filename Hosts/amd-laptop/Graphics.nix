{ config, pkgs, ... }:

{
 boot.kernelParams = [ "amdgpu.dcdebugmask=0x10" ];

 services.xserver.videoDrivers = [ "amdgpu" ];

 hardware.graphics = {
  enable = true;
  enable32Bit = true;
 };
}
