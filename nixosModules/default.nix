{ pkgs, ... }:

{

 imports = [
  ./bundles
  ./features
 ];

 nixpkgs.config.allowUnfree = true;

 nix = { 
  settings.experimental-features = [ "nix-command" "flakes" ];
  settings.auto-optimise-store = true;
  optimise.automatic = true;
 };

} 


