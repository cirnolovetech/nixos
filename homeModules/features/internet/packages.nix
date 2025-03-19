{ pkgs, ... }:

{

 home.packages = with pkgs; [
  networkmanagerapplet
  proton-vpn-gui
  vesktop
  tor-browser
  element-desktop
 ];

}

