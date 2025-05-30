{ inputs, pkgs, ... }:

{
 imports = [ inputs.stylix.homeManagerModules.stylix ];
 
 stylix = {
  enable = true;
  base16Scheme = "${pkgs.base16-schemes}/share/themes/mountain.yaml";
  autoEnable = true;
  polarity = "dark";

  iconTheme = {
   enable = true;
   package = pkgs.papirus-icon-theme;
   dark = "Papirus-Dark";
   light = "Papirus-Light";
  };

  cursor = {
   package = pkgs.vanilla-dmz;
   name = "DMZ-White";
   size = 24;
  };
  
  image = ./Wallpaper.jpg;

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

  targets = {
   hyprland.enable = false;
   waybar.enable = false;
   rofi.enable = false;
   mako.enable = false;
   dunst.enable = false;
   fcitx5.enable = false;
  };
 };
}
