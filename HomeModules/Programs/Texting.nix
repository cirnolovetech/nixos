{ pkgs, ... }:

{

 programs.neovim = {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
 };

 home.packages = with pkgs; [
  onlyoffice-desktopeditors 
  libreoffice
  obsidian
 ];


}
