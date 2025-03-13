{ pkgs, ... }:

{

 programs = {
  yazi.enable = true;
  imv.enable = true;
  zathura.enable = true;
  mpv.enable = true; 
 };
 
 xdg = {
  enable = true;
  mimeApps = {
   enable = true;
   defaultApplications = {
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];

    "image/*" = [ "imv.desktop" ];
    "video/*" = [ "mpv.desktop" ];

    "text/html" = [ "librewolf.desktop" ];
    "x-scheme-handler/http" = [ "librewolf.desktop" ];
    "x-scheme-handler/https" = [ "librewolf.desktop" ];

    "inode/directory" = [ "yazi.desktop" ];
    "application/x-directory" = [ "yazi.desktop" ];
   };
  };
 };

 home.packages = with pkgs; [
  # Compression
  p7zip
  unzip

  # Extras
  tree
  eza
  bat
 ];

}
