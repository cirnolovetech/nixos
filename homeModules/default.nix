{ pkgs, ... }:

{
 
 imports = [
  ./bundles
  ./features
 ];

 home.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
  nerd-fonts.fira-code
  nerd-fonts.droid-sans-mono
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-emoji
  noto-fonts-color-emoji
  dejavu_fonts	
  jetbrains-mono
  font-awesome
  powerline-fonts
  powerline-symbols
 ];

 programs.home-manager.enable = true;
 nixpkgs.config.allowUnfree = true;
 home = {
  username = "cirno";
  homeDirectory = "/home/cirno";
  stateVersion = "24.11";
 };

}
