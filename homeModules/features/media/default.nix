{ pkgs, ... }:

{
 
 imports = [
  ./mimeapps.nix
  ./packages.nix
 ];

 programs.pqiv.enable = true;
 programs.mpv.enable = true; 
 programs.yazi.enable = true;
 programs.zathura = {
   enable = true;
   extraConfig = 
    ''
     set selection-clipboard clipboard
    '';
  };

}
