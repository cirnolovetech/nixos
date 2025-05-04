{ config, lib, pkgs, ... }:

{
 programs.gamemode.enable = true;
 
 nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  "steam"
  "steam-original"
  "steam-unwrapped"
  "steam-run"
 ];

 programs.steam = {
  enable = true;
  gamescopeSession.enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
  localNetworkGameTransfers.openFirewall = true;
 };
}

