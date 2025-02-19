{ pkgs, ... }:

{
 home.packages = with pkgs; [
  papirus-icon-theme
 ];

 qt = {
  enable = true;
  platformTheme.name = "qt5ct";
  style = {
   package = catppuccin-qt5ct;
   name = "catppuccin-frappe";
  };
 
 gtk = {
  enable = true;
  iconTheme = {
   name = "papirus-icon-theme";
  };
  cursorTheme = {
   package = pkgs.catppuccin-cursors.macchiatoTeal;
   name = "catppuccin-macchiato-teal-cursors";
   size = 24;
 };

 home.pointerCursor = {
  name = "catppuccin-macchiato-teal-cursors";
  package = pkgs.catppuccin-cursors.macchiatoTeal;
  hyprcursor = {
   enable = true;
   size = 24;
  };
  x11 = {
   enable = true;
   defaultCursor = true;
  };
  gtk.enable = true;
  };
 };
}
