{ pkgs, ... }: 

{
 boot.loader = {
  efi.canTouchEfiVariables = true;
  timeout = 3;
  grub = {
   enable = true;
   device = "nodev";
   efiSupport = true;
   configurationLimit = 20;
  };
 };
}
