{ pkgs, ... }:

{

 home.packages = with pkgs; [
  onlyoffice-desktopeditors 
  libreoffice
  obsidian
 ];

}

