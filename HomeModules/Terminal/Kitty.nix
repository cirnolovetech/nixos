{ pkgs, ... }:

{

 programs.kitty = {
  enable = true;
 };

 xdg.desktopEntries.kitty = {
  name = "kitty";
  noDisplay = true;
 };

}
