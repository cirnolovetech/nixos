{ pkgs, ... }:

{

 services.cliphist.enable = true;

 programs.imv.enable = true;
 programs.mpv.enable = true; 
 programs.btop.enable = true;
 programs.zathura = {
   enable = true;
   extraConfig = 
    ''
     set selection-clipboard clipboard
    '';
  };
 programs.yazi = {
  enable = true;
  enableZshIntegration = true;  
  theme = {
   status = {
    separator_open = "█";
    separator_close = "█";
   };
  }; 
 };

 home.packages = with pkgs; [ 
  libreoffice
  obs-studio 
  font-manager
  tor-browser
  vesktop
  protonvpn-gui
 ];

}
