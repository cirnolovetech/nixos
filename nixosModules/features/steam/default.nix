{ config, pkgs, ... }:

{

 programs.gamemode.enable = true;
 
 programs.steam = {
  enable = true;
  gamescopeSession.enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
  localNetworkGameTransfers.openFirewall = true;
 };

}

