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

 i18n.inputMethod = {
  type = "fcitx5";
  enable = true;
  fcitx5 = {
   waylandFrontend = true;
   addons = with pkgs; [
    fcitx5-gtk
    fcitx5-bamboo
    fcitx5-unikey
   ];
  };
 };

 programs = {
  yazi = {
   enable = true;
  };
  thunar = {
   enable = true;
   plugins = with pkgs.xfce; [ 
    thunar-volman
    thunar-archive-plugin
   ];
  };
 };

 environment.systemPackages = with pkgs; [
  udiskie
 ];

 environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
