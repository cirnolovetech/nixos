{ pkgs, inputs, ... }:

{
 stylix = {
  enable = true;
  autoEnable = true;
  polarity = "dark";
  base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  image = ./wallpapers/NixOS-Gruvbox.png;
  

  iconTheme = {
   enable = true;
   package = pkgs.gruvbox-plus-icons;
   dark = Gruvbox-Plus-Dark;
   light = Gruvbox-Plus-Light;
  };

  cursor = {
   package = pkgs.capitaine-cursors-themed;
   name = "Capitaine Cursors (Gruvbox)";
   size = 24;
  };

 /* I dont know which one should i use

  fonts = {
   emoji = {
    name = "";
    package = ;
   };
   monospace = {
    name = "";
    package = ;
   };
   sansSerif = {
    name = "";
    package = ;
   };
   serif = {
    name = "";
    package = ;
   };

   sizes = {
    terminal = 13;
    applications = 11;
   };
  }; 
 
 */

 };
}
