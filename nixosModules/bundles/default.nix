{ pkgs, ... }: 

{

 imports = [
  ./desktop.nix
  ./gaming-desktop.nix
 ];

 boot.loader = {
  efi.canTouchEfiVariables = true;
  timeout = 3;
  systemd-boot = {
   enable = true;
   configurationLimit = 20;
   editor = false;
  };
 };

}

