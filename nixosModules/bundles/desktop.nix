{ config, pkgs, ... }:

{

 i18n.defaultLocale = "en_US.UTF-8"; 
 i18n.extraLocaleSettings = {
   LC_ADDRESS = "vi_VN";
   LC_IDENTIFICATION = "vi_VN";
   LC_MEASUREMENT = "vi_VN";
   LC_MONETARY = "vi_VN";
   LC_NAME = "vi_VN";
   LC_NUMERIC = "vi_VN";
   LC_PAPER = "vi_VN";
   LC_TELEPHONE = "vi_VN";
   LC_TIME = "vi_VN";
  };

 time.timeZone = "Asia/Ho_Chi_Minh";
 time.hardwareClockInLocalTime = true;

 networking.networkmanager.enable = true;

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

 environment.systemPackages = with pkgs; [ sddm-astronaut ];
 services.displayManager.sddm = {
  enable = true;
  wayland.enable = true;
  theme = "sddm-astronaut-theme";
  package = pkgs.kdePackages.sddm;
  extraPackages = with pkgs; [ pkgs.sddm-astronaut ];
 };

 programs.hyprland = {
  enable = true;
  withUWSM = true;
  xwayland.enable = true;
 };
 services.hypridle.enable = true;
 programs.hyprlock.enable = true;
 security.pam.services.hyprlock = {};

 environment.sessionVariables.NIXOS_OZONE_WL = "1";

}
