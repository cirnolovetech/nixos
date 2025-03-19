{ pkgs, ... }:

{

 imports = [
  ./packages.nix
 ];

 services.cliphist = {
  enable = true;
 };

}
