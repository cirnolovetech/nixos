{ pkgs, inputs, ... }:

{

 imports = [ inputs.stylix.homeManagerModules.stylix ];

 stylix = {
  enable = true;
  autoEnable = true;

  base16Scheme = {
   base00 = "232428"; 
   base01 = "242424"; 
   base02 = "303030"; 
   base03 = "545558"; 
   base04 = "d8dee9"; 
   base05 = "e5e9f0";
   base06 = "eceff4";
   base07 = "ffffff";
   base08 = "bf616a";
   base09 = "d08770";
   base0A = "ebcb8b"; 
   base0B = "a3be8c"; 
   base0C = "8fbcbb"; 
   base0D = "81a1c1"; 
   base0E = "b48ead"; 
   base0F = "d08770"; 
  };

  polarity = "dark";
  image = ./Wallpaper.png; 
  
  targets = {
   waybar.enable = false;
  };

  iconTheme = {
   enable = true;
   package = pkgs.papirus-icon-theme;
   dark = "Papirus-Dark";
   light = "Papirus-Light";
  };
  
  fonts = {
   emoji = {
    name = "Noto Color Emoji";
    package = pkgs.noto-fonts-color-emoji;
   };
   monospace = {
    name = "JetBrains Mono";
    package = pkgs.jetbrains-mono;
   };
   sansSerif = {
    name = "Noto Sans";
    package = pkgs.noto-fonts;
   };
   serif = {
    name = "Noto Serif";
    package = pkgs.noto-fonts;
   };

   sizes = {
    terminal = 13;
    applications = 11;
   };
  };
    
  cursor = {
   package = pkgs.vanilla-dmz;
   name = "DMZ-White";
   size = 24;
  };
 };

}
