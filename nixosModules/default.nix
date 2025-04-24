{ user, inputs, pkgs, ... }:

{

 imports = [
  ./bundles
  ./features
  inputs.home-manager.nixosModules.default
 ];

 programs.zsh.enable = true;
 users = {
  defaultUserShell = pkgs.zsh;
  users.${user} = {
   isNormalUser = true;
   extraGroups = [ "wheel" "networkmanager" ];
  };
 };

 home-manager = {
  extraSpecialArgs = { inherit inputs; };
  users.${user} = {
   imports = [ ./../homeModules ];
  };
 };

 nixpkgs.config.allowUnfree = true;
 nix.settings.experimental-features = [ "nix-command" "flakes" ];
 nix.optimise.automatic = true;
 nix.settings.auto-optimise-store = true;

} 


