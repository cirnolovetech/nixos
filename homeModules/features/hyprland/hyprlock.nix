{ pkgs, ... }:

{

 programs.hyprlock = {
  enable = true;
  settings = {
   general = {
    grace = 1;
   };

   label = [
    {
     text = ''cmd[update:18000000] echo "$(date +'%-d %B %Y')"'';
     font = 40;
     position = "0, -150";
     halign = "center";
     valign = "top";
    }
       
    {
     text = ''cmd[update:1000] echo "$(date +'%H:%M')"'';
     font_size = 38;
     position = "0, -80";
     halign = "center";
     valign = "top";
    }
   ];
  };
 };

}
