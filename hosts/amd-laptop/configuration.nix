{ pkgs, stateVersion, hostname, ... }:

{

 imports = [
  ./../../nixosModules
  ./hardware-configuration.nix
 ];
 
 networking.hostName = hostname;
 networking.networkmanager.enable = true;

 system.stateVersion = stateVersion;

}
