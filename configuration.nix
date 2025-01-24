
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

  # Graphics Driver
  services.xserver.videoDrivers = ["amdgpu"];

  # Power Management
  services.power-profiles-daemon.enable = false;
  services.tlp = {
     enable = true;
     settings = {
      # CPU
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      # Battery Health
      STOP_CHARGE_THRESH_BAT0 = 90;
      START_CHARGE_THRESH_BAT0 = 40;
    };
  };

  # Shell
  programs.zsh.enable = true;

  # Text Editor
  programs.neovim = {
     enable = true;
     defaultEditor = true;
  };

  # Fonts & Icons
  fonts.packages = with pkgs; [
     noto-fonts
     noto-fonts-cjk-sans
     noto-fonts-emoji
  ];

  # Browser
  programs.firefox.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
     # Home manager
     home-manager
     # Terminal & CLI
     kitty starship wget git p7zip unrar
     # Media
     mpv
     # Internet
     tor-browser protonvpn-gui vesktop element-desktop
     # Productivity
     libreoffice obsidian gimp krita
     # Tools
     xclicker obs-studio
     # Gaming
     prismlauncher mangohud
  ];

  # Steam & Feral Game Mode
  programs.steam = {
     enable = true;
     gamescopeSession.enable = true;
     remotePlay.openFirewall = true;
     dedicatedServer.openFirewall = true;
     localNetworkGameTransfers.openFirewall = true;
  };
  programs.gamemode.enable = true;

  # Home Manager
  home-manager = {
     extraSpecialArgs = {inherit inputs;};
     users = {
      "cirno" = import ./home.nix;
    };
  };

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
