{ pkgs, ... }:

{
 nixpkgs.config.allowUnfree = true;

 home.packages = with pkgs; [
  # Social
  vesktop
  element-desktop

  # Gaming
  prismlauncher

  # Office
  libreoffice
  obsidian
  
  # GUI Tools
  networkmanagerapplet
  font-manager
  xclicker
  pwvucontrol
  pamixer

  # CLI Tools
  grim
  slurp
  p7zip
  unzip
  eza
  bat
  wl-clipboard
  wl-clipboard-x11
  wl-clip-persist
  playerctl
  brightnessctl

  # Extras
  tor-browser
  sddm-astronaut
 ];
}
