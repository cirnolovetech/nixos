{ pkgs, ... }:

{
 home.packages = [ pkgs.rofi-power-menu ];

 programs.rofi = {
  enable = true;
  package = pkgs.rofi-wayland;
  plugins = with pkgs; [ rofi-emoji-wayland ];
  theme = ./Theme.rasi;
  extraConfig = {
   display-drun = "Search:";
   display-window = "Windows:";
   display-emoji = "Emoji:";
   display-clipboard = "Clipboard:";
   drun-display-format = "{icon} {name}";
   modi = "drun,run,window,emoji";
   show-icons = true;
  };
 };
}
