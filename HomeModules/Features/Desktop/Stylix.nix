{ inputs, pkgs, ... }:

{
 imports = [ inputs.stylix.homeManagerModules.stylix ];
 
 stylix = {
  enable = true;
  autoEnable = true;
  polarity = "dark";
  image = ./Wallpaper.png;
  base16Scheme = {
   base00 = "#1a1a1a";
   base01 = "#282828";
   base02 = "#383838";
   base03 = "#585858";
   base04 = "#eeeeee";
   base05 = "#eeeeee";
   base06 = "#e8e8e8";
   base07 = "#f8f8f8";
   base08 = "#ab4642";
   base09 = "#dc9656";
   base0A = "#f7ca88";
   base0B = "#a1b56c";
   base0C = "#86c1b9";
   base0D = "#7cafc2";
   base0E = "#ba8baf";
   base0F = "#a16946";
  };
 
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
   dunst.enable = false;
   fcitx5.enable = false;
  };
 };
}
