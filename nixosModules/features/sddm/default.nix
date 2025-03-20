{ config, pkgs, ... }:

{
 
 environment.systemPackages = with pkgs; [ sddm-astronaut ];

 services.displayManager.sddm = {
  enable = true;
  wayland.enable = true;
  theme = "sddm-astronaut-theme";
  package = pkgs.kdePackages.sddm;
  extraPackages = with pkgs; [ pkgs.sddm-astronaut ];
 };

}
