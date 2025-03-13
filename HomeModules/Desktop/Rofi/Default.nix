{ pkgs, ... }:

{

 programs.rofi = {
  enable = true;
  package = pkgs.rofi-wayland;
  extraConfig = {
   display-drun = "Applications:";
   display-window = "Windows:";
   drun-display-format = "{icon} {name}";
   modi = "drun,run,window";
   show-icons = true;
  };
 };

}
