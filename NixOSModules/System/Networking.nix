{ config, pkgs, ... }: 

{

 programs = {
  nm-applet.enable = true;
  nm-applet.indicator = true;
 }; 

 networking = {
  hostName = "nixos";
  networkmanager.enable = true;
 }; 

}
