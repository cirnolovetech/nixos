{ pkgs, ... }:

{

 home.packages = with pkgs; [
  # Network Manager
  networkmanagerapplet

  # Audio
  pwvucontrol
  pamixer

  # Screenshot
  grim
  slurp
  
  # Brightness
  brightnessctl 
 ];

}
