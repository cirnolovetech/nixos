{ config, pkgs, ... }:

{
 programs.hyprland = {
  enable = true;
  withUWSM = true;
  xwayland.enable = true;
 };

 services.hypridle.enable = true;
 
 programs.hyprlock.enable = true;
 security.pam.services.hyprlock = {};
}
