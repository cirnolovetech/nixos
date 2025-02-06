{ pkgs, ... }:

{
 home = {
  pointerCursor = {
   package = pkgs.vanilla-dmz;
   name = "Vanilla-DMZ";
   hyprcursor = {
    enable = true;
    size = 24;
   };
   gtk.enable = true;
   x11 = {
    enable = true; 
    defaultCursor = true;
   };
  };
 };
}
