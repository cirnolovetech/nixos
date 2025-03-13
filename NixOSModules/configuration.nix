{ config, pkgs, lib, inputs, ... }:

{
 imports = [
 
  ./Programs/Gaming.nix
  ./System/Audio.nix
  ./System/Bootloader.nix
  ./System/Display-Manager.nix
  ./System/Graphical.nix
  ./System/Input.nix
  ./System/Locale.nix
  ./System/Networking.nix
  ./System/Packaging.nix
  ./System/Timezone.nix

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

 # TLP
 services.tlp = {
  enable = true;
  settings = {
   CPU_SCALING_GOVERNOR_ON_AC = "performance";
   CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
   CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
   CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
   CPU_MIN_PERF_ON_AC = 0;
   CPU_MAX_PERF_ON_AC = 100;
   CPU_MIN_PERF_ON_BAT = 0;
   CPU_MAX_PERF_ON_BAT = 20;
  };
 };
 
 programs.hyprland = {
  enable = true;
  withUWSM = true;
  xwayland.enable = true;
 };
 programs.hyprlock.enable = true;
 services.hypridle.enable = true;

 nix.settings.experimental-features = [ "nix-command" "flakes" ];

 system.stateVersion = "24.11";
}
