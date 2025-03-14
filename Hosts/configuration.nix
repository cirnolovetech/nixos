{ config, pkgs, lib, inputs, ... }:

{

 imports = [
  ./../NixOSModules/Default.nix
  ./hardware-configuration.nix
  inputs.home-manager.nixosModules.default
 ];
 
 home-manager = {
  extraSpecialArgs = {inherit inputs;};
   users.cirno = {
    imports = [
     ./../HomeModules/Home.nix
    ];
   };
 };
 
 programs.zsh.enable = true;
 users.users.cirno = {
  isNormalUser = true;
  description = "Cirno";
  shell = pkgs.zsh;
  extraGroups = [ "networkmanager" "wheel" ];
 };
 nixpkgs.config.allowUnfree = true;

 nix.settings = {
  experimental-features = [ "nix-command" "flakes" ];
  auto-optimise-store = true;
 };

 system.stateVersion = "24.11";

}
