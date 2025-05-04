{ config, pkgs, ... }:

{
 i18n.defaultLocale = "en_US.UTF-8"; 
 time.timeZone = "Asia/Ho_Chi_Minh";

 security.rtkit.enable = true;
 services = {
  pipewire = {
   enable = true;
   wireplumber.enable = true;
   alsa.enable = true;
   alsa.support32Bit = true;
   jack.enable = true;
   pulse.enable = true;
  };
  playerctld.enable = true;
 };

 environment.systemPackages = with pkgs; [
  networkmanagerapplet
  
  tor-browser

  signal-desktop
 ];

 environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
