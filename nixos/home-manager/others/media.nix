{ pkgs, ... }:

{
 home.packages = with pkgs; [
  p7zip
  unzip
 ];

 programs = {
  yazi.enable = true;
  imv.enable = true;
  mpv.enable = true;
  zathura.enale = true;
 };
}
