{ pkgs, ... }:

{

 programs.btop.enable = true;
 
 xdg.desktopEntries.btop = {
  name = "btop++";
  noDisplay = true;
 };

}
