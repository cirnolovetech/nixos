
{ config, pkgs, inputs, ... }:

{
 # Nix Network
 imports = [
 ./hardware-configuration.nix
 ];

 # Bootloader
 boot.loader = {
  systemd-boot.enable = true;
  efi.canTouchEfiVariables = true;
 };

# Networking
 networking = {
  hostName = "nixos";
  firewall = {
   enable = true;
  };
  networkmanager = {
   enable = true;
  };
 };

 # Vietnamese
 time.timeZone = "Asia/Ho_Chi_Minh";
 i18n = {
  defaultLocale = "en_US.UTF-8";
  inputMethod = {
   type = "fcitx5";
   enable = true;
   fcitx5.addons = with pkgs; [
    kdePackages.fcitx5-qt
    catppuccin-fcitx5
    fcitx5-mozc
    fcitx5-unikey
    fcitx5-bamboo
   ];
  };
  extraLocaleSettings = {
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
 };

 # X11
 services.xserver= {
  enable = true;
  videoDrivers = ["amdgpu"];
  xkb = {
   layout = "us";
  };
 };

 # WM
 services.displayManager.sddm = {
  enable = true;
  theme = "catppuccin-mocha";
  package = pkgs.kdePackages.sddm;
 };
 services.hypridle.enable = true;
 programs = {
  hyprland = {
   enable = true;
   xwayland.enable = true;
  };
  hyprlock.enable = true;
 };
 
 # Audio
 security.rtkit.enable = true;
 services.pipewire = {
  enable = true;
  pulse.enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
 };

 # User
 users.users.cirno = {
  isNormalUser = true;
  description = "Cirno";
  shell = pkgs.zsh;
  extraGroups = [ "networkmanager" "wheel" ];
 };

 # Hardware
 hardware.graphics = {
  enable = true;
  enable32Bit = true;
 };

 # Power Management
 services = {
  power-profiles-daemon.enable = false;
  tlp = {
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
 };

 # Special Programs
 programs = {
  # Browser
  firefox.enable = true;

  # Shell
  zsh.enable = true;

  # File Manager
  yazi.enable = true;

  # Text Editor
  neovim = {
   enable = true;
   defaultEditor = true;
  };

  # Gamemode
  gamemode.enable = true;

  # Steam
  steam = {
   enable = true;
   gamescopeSession.enable = true;
   remotePlay.openFirewall = true;
   localNetworkGameTransfers.openFirewall = true;
   dedicatedServer.openFirewall = true;
  };
 };

 # Packages
 nixpkgs.config.allowUnfree = true;
 environment.systemPackages = with pkgs; [
  dunst waybar wofi kitty hyprshot hyprpaper pwvucontrol playerctl brightnessctl wl-clipboard microfetch
  btop font-manager p7zip zip mpv obs-studio okular libreoffice gimp obsidian prismlauncher mangohud
  librewolf tor-browser vesktop element-desktop xclicker vanilla-dmz catppuccin-sddm home-manager
 ];

 # Fonts 
 fonts.packages = with pkgs; [
  font-awesome
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-emoji
 ];

 # Features & Optimization
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

# Version
system.stateVersion = "24.11";
}
