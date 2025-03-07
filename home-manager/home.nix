{ pkgs, ... }:

{
 home.username = "cirno";
 home.homeDirectory = "/home/cirno";
 home.stateVersion = "24.11";

 imports = [
  ./modules/default.nix
  ./home-packages.nix
 ];

 programs.home-manager.enable = true;
}
