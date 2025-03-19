{ pkgs, ... }:

{
 
 home.packages = with pkgs; [
  microfetch
  eza
  bat
  pwvucontrol
  pamixer
  brightnessctl 
  cava
  cmatrix
  cbonsai
 ];

}



