{ pkgs, ... }:

{
 imports = [
  ./Bundles
  ./Features
 ];

 programs.home-manager.enable = true;
 nixpkgs.config.allowUnfree = true;
 home = {
  username = "cirno";
  homeDirectory = "/home/cirno";
  stateVersion = "24.11";
 };
}
