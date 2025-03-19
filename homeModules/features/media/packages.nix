{ pkgs, ... }:

{ 

 home.packages = with pkgs; [
  p7zip
  unzip
  gimp
  grim
  slurp
  obs-studio
 ];

}
