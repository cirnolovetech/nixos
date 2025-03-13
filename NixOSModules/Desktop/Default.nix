{ config, pkgs, ... }:

{

 programs.hyprland = {
  enable = true;
  withUWSM = true;
  xwayland.enable = true;
 };
 programs.hyprlock.enable = true;
 services.hypridle.enable = true;

}
