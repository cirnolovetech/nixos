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
     font = 38;
     position = "0, -150";
     halign = "center";
     valign = "top";
    }
       
    {
     text = ''cmd[update:1000] echo "$(date +'%H:%M:%S')"'';
     font_size = 80;
     position = "0, 100";
     halign = "center";
     valign = "bottom";
    }
   ];
  };
 };

}
