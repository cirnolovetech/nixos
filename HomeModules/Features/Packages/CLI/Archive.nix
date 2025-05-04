{ pkgs, ... }:

{
 home.packages = with pkgs; [
  p7zip
  unar
  unzip
 ];
}
