{ pkgs, ... }:

{
 home = {
  pointerCursor = {
   package = pkgs.catppuccin-cursors;
   name = "mochaBlue";
   size = 24;
   gtk.enable = true;
   x11 = {
    enable = true; 
    defaultCursor = true;
   };
  };
 };
}
