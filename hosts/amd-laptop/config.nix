{ stateVersion, hostname, ... }:

{

 imports = [
  ./../../nixosModules
  ./battery.nix
  ./driver.nix
  ./hardware.nix
 ];
 
 networking.hostName = hostname;
 system.stateVersion = stateVersion;

}
