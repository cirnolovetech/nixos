{ pkgs, ... }:

{

 home.packages = with pkgs; [
  networkmanagerapplet
  pwvucontrol
  pamixer
  grim
  slurp  
  brightnessctl 
 ];

}
