{ pkgs, ... }:

{

 home.packages = with pkgs; [
  wl-clipboard
  wl-clipboard-x11
  wl-clip-persist
 ];

 services.cliphist = {
  enable = true;
 };

}
