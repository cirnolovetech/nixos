{ pkgs, ... }:

{

 programs.pqiv.enable = true;
 programs.mpv.enable = true; 

 programs.zathura = {
   enable = true;
   extraConfig = 
    ''
     set selection-clipboard clipboard
    '';
  };

}
