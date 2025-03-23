{ pkgs, ... }:

{

 programs.rofi = {
  enable = true;
  package = pkgs.rofi-wayland;
  plugins = with pkgs; [
   rofi-emoji-wayland
  ];
  theme = ./theme.rasi;
  extraConfig = {
   display-drun = "Search:";
   display-window = "Windows:";
   display-emoji = "Emoji:";
   drun-display-format = "{icon} {name}";
   modi = "drun,run,window,emoji";
   show-icons = true;
  };
 };

 home.packages = [ pkgs.rofi-power-menu ];

}
