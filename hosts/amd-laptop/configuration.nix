{ pkgs, stateVersion, hostname, ... }:

{

 imports = [
  ./../../nixosModules
  ./hardware-configuration.nix
 ];
 
 nixpkgs.config.allowUnfree = true;
 nix = {
  settings.experimental-features = [ "nix-command" "flakes" ];
  settings.auto-optimise-store = true;
  optimise.automatic = true;
 };

 networking.hostName = hostname;
 networking.networkmanager.enable = true;

 system.stateVersion = stateVersion;

}
