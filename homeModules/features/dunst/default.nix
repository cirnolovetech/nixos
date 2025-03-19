{ pkgs, ... }:

{

 imports = [
  ./packages.nix
 ];

 services.dunst = {
  enable = true;
 };

}
