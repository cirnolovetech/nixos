{ config, pkgs, ... }:

{
 imports = [
  ./modules/default.nix
 ];

 home = {
  username = "cirno";
  homeDirectory = "/home/cirno";
  stateVersion = "24.11";
 };
}
