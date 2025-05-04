{ stateVersion, hostname, config, ... }:

{
 imports = [
  ./../../NixModules
  ./Battery.nix
  ./Graphics.nix
  ./Hardware.nix
 ];
  
 nix.settings.experimental-features = [ "nix-command" "flakes" ];
 nix.optimise.automatic = true;
 nix.settings.auto-optimise-store = true;

 networking.hostName = hostname;
 networking.networkmanager.enable = true;
 system.stateVersion = stateVersion;
}
