{ pkgs, ... }:

{

 services.dunst = {
  enable = true;
  settings = {
   global = {
    width = 400;
    height = 300;
    offset = "10x30";
    origin = "top-right";
    frame_color = "#eeeeee";
    font = "JetBrains Mono";
   };

   urgency_normal = {
    background = "#1a1a1a";
    foreground = "#eeeeee";
    timeout = 5;
   };
  };
 };

}
