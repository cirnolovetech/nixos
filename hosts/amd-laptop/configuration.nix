{ pkgs, stateVersion, hostname, ... }:

{

 imports = [
  ./../../nixosModules
  ./hardware-configuration.nix
 ];
 
 nixpkgs.config.allowUnfree = true;
 nix.settings.experimental-features = [ "nix-command" "flakes" ];
 nix.settings.auto-optimise-store = true;


 networking.hostName = hostname;
 networking.networkmanager.enable = true;


 system.stateVersion = stateVersion;

}
