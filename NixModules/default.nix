{ user, inputs, pkgs, ... }:

{
 imports = [
  ./Bundles
  ./Features
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
   imports = [ ./../HomeModules ];
  };
 };
} 


