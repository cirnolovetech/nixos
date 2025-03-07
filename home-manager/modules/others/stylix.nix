{ pkgs, inputs, ... }:

{
 imports = [ inputs.stylix.homeManagerModules.stylix ];

 home.packages = with pkgs; [
  jetbrains-mono
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-emoji
  nerd-fonts.fira-code
  nerd-fonts.droid-sans-mono
 ];

 stylix = {
  enable = true;
  autoEnable = true;
  polarity = "dark";
  base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  image = ../wallpaper/NixOS-Gruvbox.png;
  
  iconTheme = {
   enable = true;
   package = pkgs.gruvbox-plus-icons;
   dark = "Gruvbox-Plus-Dark";
   light = "Gruvbox-Plus-Light";
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
   package = pkgs.capitaine-cursors-themed;
   name = "Capitaine Cursors (Gruvbox)";
   size = 24;
  };


 };
}
