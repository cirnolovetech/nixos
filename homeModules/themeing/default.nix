{ pkgs, inputs, ... }:

{

 imports = [ inputs.stylix.homeManagerModules.stylix ];

 stylix = {
  enable = true;
  base16Scheme = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";
  polarity = "dark";
  image = ./Wallpaper.png; 
  
  targets = {
   waybar.enable = false;
   rofi.enable = false;
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

 home.packages = with pkgs; [
  font-manager
  nerd-fonts.fira-code
  nerd-fonts.droid-sans-mono
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-emoji
  noto-fonts-color-emoji
  dejavu_fonts	
  jetbrains-mono
  font-awesome
  powerline-fonts
  powerline-symbols
 ];

}
