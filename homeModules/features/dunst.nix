{ pkgs, ... }:

{

 services.dunst = {
  enable = true;
  settings = {
   global = {
    width = 400;
    height = 300;
    icon_corners = "none";
    font = "JetBrains Mono 8";
    origin = "top-center";
    frame_color = "#eeeeee";
   };

   urgency_normal = {
    background = "#1a1a1a";
    foreground = "#eeeeee";
    timeout = 5;
   };
  };
 };

}
