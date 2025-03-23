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
     text = ''cmd[update:1000] echo "$(date +'%H:%M')"'';
     font_size = 38;
     position = "0, -120";
     halign = "center";
     valign = "top";
    }
   ];
  };
 };

}
