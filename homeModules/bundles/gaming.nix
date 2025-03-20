{ pkgs, ... }:

{

 home.packages = with pkgs; [
  steamtinkerlaunch
  protonup-ng
  xclicker

  lutris
  bottles

  prismlauncher
  ferium
  
  luanti
 ];

 programs.mangohud.enable = true;

} 
  
