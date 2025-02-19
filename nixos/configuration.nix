
{ config, pkgs, inputs, ... }:

{
 imports = [
 ./hardware-configuration.nix
 ];

#    ___            __  __             __       
#   / _ )___  ___  / /_/ /__  ___ ____/ /__ ____
#  / _  / _ \/ _ \/ __/ / _ \/ _ `/ _  / -_) __/
# /____/\___/\___/\__/_/\___/\_,_/\_,_/\__/_/   
#                                               
 boot.loader.systemd-boot.enable = true;
 boot.loader.efi.canTouchEfiVariables = true;

#   __  __           
#  / / / /__ ___ ____
# / /_/ (_-</ -_) __/
# \____/___/\__/_/
#
 users.users.cirno = {
  isNormalUser = true;
  description = "Cirno";
  shell = pkgs.zsh;
  extraGroups = [ "networkmanager" "wheel" ];
 };

#    _  __    __                  __    _          
#   / |/ /__ / /__    _____  ____/ /__ (_)__  ___ _
#  /    / -_) __/ |/|/ / _ \/ __/  '_// / _ \/ _ `/
# /_/|_/\__/\__/|__,__/\___/_/ /_/\_\/_/_//_/\_, / 
#                                           /___/  
 networking.hostName = "nixos";
 networking.firewall.enable = true;
 networking.networkmanager.enable = true;

#  _   ___     __                             
# | | / (_)__ / /____  ___ ___ _  ___ ___ ___ 
# | |/ / / -_) __/ _ \/ _ `/  ' \/ -_|_-</ -_)
# |___/_/\__/\__/_//_/\_,_/_/_/_/\__/___/\__/ 
#
 time.timeZone = "Asia/Ho_Chi_Minh";
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

#    ____               __    __  ___    __  __           __
#   /  _/__  ___  __ __/ /_  /  |/  /__ / /_/ /  ___  ___/ /
#  _/ // _ \/ _ \/ // / __/ / /|_/ / -_) __/ _ \/ _ \/ _  / 
# /___/_//_/ .__/\_,_/\__/ /_/  /_/\__/\__/_//_/\___/\_,_/  
#         /_/                                             
 i18n.inputMethod = {
   type = "fcitx5";
   enable = true;
   fcitx5 = {
   waylandFrontend = true;
   addons = with pkgs; [
    kdePackages.fcitx5-qt
    fcitx5-bamboo
   ];
  };
 };

#    __ __            __                   
#   / // /__ ________/ /    _____ ________ 
#  / _  / _ `/ __/ _  / |/|/ / _ `/ __/ -_)
# /_//_/\_,_/_/  \_,_/|__,__/\_,_/_/  \__/ 
#
 services.xserver.videoDrivers = ["amdgpu"];
 hardware.graphics = {
  enable = true;
  enable32Bit = true;
 };

#    ___                       __  ___                           
#   / _ \___ _    _____ ____  /  |/  /__ ____  ___ ____ ____ ____
#  / ___/ _ \ |/|/ / -_) __/ / /|_/ / _ `/ _ \/ _ `/ _ `/ -_) __/
# /_/   \___/__,__/\__/_/   /_/  /_/\_,_/_//_/\_,_/\_, /\__/_/   
#                                              /___/          
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

#    ___  _          __            __  ___                           
#   / _ \(_)__ ___  / /__ ___ __  /  |/  /__ ____  ___ ____ ____ ____
#  / // / (_-</ _ \/ / _ `/ // / / /|_/ / _ `/ _ \/ _ `/ _ `/ -_) __/
# /____/_/___/ .__/_/\_,_/\_, / /_/  /_/\_,_/_//_/\_,_/\_, /\__/_/   
#           /_/          /___/                      /___/          
 services.displayManager.sddm = {
  enable = true;
  wayland.enable = true;
  theme = "sddm-astronaut-theme";
  package = pkgs.kdePackages.sddm;
  extraPackages = [ pkgs.sddm-astronaut ];
 };
 
#    __ __              __             __
#   / // /_ _____  ____/ /__ ____  ___/ /
#  / _  / // / _ \/ __/ / _ `/ _ \/ _  / 
# /_//_/\_, / .__/_/ /_/\_,_/_//_/\_,_/  
#      /___/_/                            
 programs.hyprland = {
   enable = true;
   xwayland.enable = true;
  };
 programs.hyprlock.enable = true;
 services.hypridle.enable = true;
 
#    ___          ___    
#   / _ |__ _____/ (_)__ 
#  / __ / // / _  / / _ \
# /_/ |_\_,_/\_,_/_/\___/
# 
 security.rtkit.enable = true;
 services.pipewire = {
  enable = true;
  pulse.enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
 };

#    ___                                 
#   / _ \_______  ___ ________ ___ _  ___
#  / ___/ __/ _ \/ _ `/ __/ _ `/  ' \(_-<
# /_/  /_/  \___/\_, /_/  \_,_/_/_/_/___/
#               /___/                    
 programs.firefox = {
  enable = true;
  package = pkgs.librewolf;
  policies = {
   DisableTelemetry = true;
   DisableFirefoxStudies = true;
   Preferences = {
    "cookiebanners.service.mode.privateBrowsing" = 2;
    "cookiebanners.service.mode" = 2;
    "privacy.donottrackheader.enabled" = true;
    "privacy.fingerprintingProtection" = true;
    "privacy.resistFingerprinting" = true;
    "privacy.trackingprotection.emailtracking.enabled" = true;
    "privacy.trackingprotection.enabled" = true;
    "privacy.trackingprotection.fingerprinting.enabled" = true;
    "privacy.trackingprotection.socialtracking.enabled" = true;
   };
  };
 };

 programs.zsh.enable = true;
 programs.yazi.enable = true;
 programs.neovim = {
   enable = true;
   defaultEditor = true;
  };

#   _____           _          
#  / ___/__ ___ _  (_)__  ___ _
# / (_ / _ `/  ' \/ / _ \/ _ `/
# \___/\_,_/_/_/_/_/_//_/\_, / 
#                       /___/  
 programs.gamemode.enable = true;
 programs.steam = {
  enable = true;
  gamescopeSession.enable = true;
  remotePlay.openFirewall = true;
  localNetworkGameTransfers.openFirewall = true;
  dedicatedServer.openFirewall = true;
 };

#    ___           __                   
#   / _ \___ _____/ /_____ ____ ____ ___
#  / ___/ _ `/ __/  '_/ _ `/ _ `/ -_|_-<
# /_/   \_,_/\__/_/\_\\_,_/\_, /\__/___/
#                        /___/         
 nixpkgs.config.allowUnfree = true;
 environment.systemPackages = with pkgs; [
  dunst waybar wofi kitty hyprshot swww pwvucontrol playerctl brightnessctl wl-clipboard xclicker
  btop font-manager p7zip zip mpv obs-studio okular libreoffice gimp obsidian prismlauncher mangohud
  librewolf tor-browser vesktop element-desktop home-manager vanilla-dmz sddm-astronaut
 ];

#    ____          __    
#   / __/__  ___  / /____
#  / _// _ \/ _ \/ __(_-<
# /_/  \___/_//_/\__/___/
#
 fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-emoji
 ];
 
#    _  ___      ____  ____
#   / |/ (_)_ __/ __ \/ __/
#  /    / /\ \ / /_/ /\ \  
# /_/|_/_//_\_\\____/___/
#
 nix = {
  settings.experimental-features = [ "nix-command" "flakes" ];
  optimise.automatic = true;
  settings.auto-optimise-store = true;
  gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 5d";
  };
 };

 system.stateVersion = "24.11";
}
