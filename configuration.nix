
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.firewall.enable = true;
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Internationalisation
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

  # X11
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
  };

  # DM & DE & WM
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Input Method
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
     fcitx5-gtk
     fcitx5-bamboo
    ];
  };

  # Audio
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Username
  users.users.cirno = {
    isNormalUser = true;
    description = "Cirno";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
     kdePackages.kate
     kdePackages.dolphin
    ];
  };

  # Devices
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # Display
    hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = ["amdgpu"];

  # Fonts & Icons
  fonts.packages = with pkgs; [
     noto-fonts
     noto-fonts-cjk-sans
     noto-fonts-emoji
  ];

  # Shell
  programs.zsh.enable = true;

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    home-manager starship zsh wget git p7zip unrar neofetch mpv obs-studio
    tor-browser protonvpn-gui vesktop element-desktop libreoffice obsidian
    gimp prismlauncher mangohud xclicker
  ];

  # Browser
  programs.firefox.enable = true;

  # Gaming
  programs.gamemode.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Features and Optimization
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
