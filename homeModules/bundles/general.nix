{ pkgs, ... }:

{

 home.packages = with pkgs; [
  networkmanagerapplet
  tor-browser
  protonvpn-gui

  vesktop
  element-desktop

  onlyoffice-desktopeditors 
  libreoffice
  obsidian
  
  gimp
  krita

  microfetch
  cava
  cmatrix
  cbonsai
  
  p7zip
  unzip
  eza
  bat
  
  wl-clipboard
  wl-clipboard-x11
  wl-clip-persist 
  grim
  slurp
  obs-studio
  
  pwvucontrol
  pamixer
 
  font-manager
  libnotify
  brightnessctl
 ];

}
