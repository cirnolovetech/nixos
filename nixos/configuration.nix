{ config, pkgs, inputs, ... }:

{
 imports = [
  ./hardware-configuration.nix
  ./stylix.nix
  inputs.home-manager.nixosModules.default
 ];
 
 home-manager = {
  extraSpecialArgs = {inherit inputs;};
   users.cirno = {
    imports = [
     ./home.nix
     ./stylix.nix
    ];
   };
 };
 
 # Bootloader
 boot.loader = { 
  systemd-boot.enable = true;
  efi.canTouchEfiVariables = true;
 };
 
 # User
 users.users.cirno = {
  isNormalUser = true;
  description = "Cirno";
  shell = pkgs.zsh;
  extraGroups = [ "networkmanager" "wheel" ];
 };
 
 # Networking
 networking = {
  hostName = "nixos";
   #nameservers = [
   # "1.1.1.1"
   # "1.0.0.1"
   #];
  firewall.enable = true;
  networkmanager.enable = true;
 };
 
 # Vietnamese
 time.timeZone = "Asia/Ho_Chi_Minh";

 i18n = {
  defaultLocale = "en_US.UTF-8";
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
 
  inputMethod = {
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

 # AMD
 hardware.graphics = {
  enable = true;
  enable32Bit = true;
 };
 services.xserver.videoDrivers = ["amdgpu"];

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
 
 # SDDM
 services.displayManager.sddm = {
  enable = true;
  wayland.enable = true;
  theme = "sddm-astronaut-theme";
  package = pkgs.kdePackages.sddm;
  extraPackages = with pkgs; [ pkgs.sddm-astronaut ];
 };

 # Hyprland
 programs.hyprland = {
  enable = true;
  xwayland.enable = true;
  withUSWM.enalbe = true;
 };
 programs.hyprlock.enable = true;
 services.hypridle.enable = true;

 # Audio
 security.rtkit.enable = true;
 services.pipewire = {
  enable = true;
  wireplumber.enable = true;
  pulse.enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
 };

 programs.zsh.enable = true;
 
 # Neovim
 programs.neovim.enable = true;
 environment.variables.EDITOR = lib.mkOverride 900 "nvim";
 environment.variables.VISUAL = lib.mkOverride 900 "nvim";
 environment.variables.SUDO_EDITOR = lib.mkOverride 900 "nvim";
 
 # Steam
 programs.steam = {
  enable = true;
  gamescopeSession.enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
  localNetworkGameTransfers.openFirewall = true;
 };
 
 # Packages
 nixpkgs.config.allowUnfree = true;
 environment.systemPackages = with pkgs; [
  networkmanagerapplet
  playerctl
  brightnessctl
  sddm-astronaut
  font-manager
  tor-browser
 ];
 
 nix.settings = {
  experimental-features = [ "nix-command" "flakes" ];
  auto-optismise-store = true;
 }; 

 system.stateVersion = "24.11";
}
