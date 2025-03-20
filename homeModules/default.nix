{ pkgs, ... }:

{
 
 imports = [
  ./bundles
  ./features
 ];
 
 nixpkgs.config.allowUnfree = true;

 home.username = "cirno";
 home.homeDirectory = "/home/cirno";
 home.stateVersion = "24.11";

 programs.home-manager.enable = true;

}
