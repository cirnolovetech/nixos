{ pkgs, ... }:

{
 home.username = "cirno";
 home.homeDirectory = "/home/cirno";
 home.stateVersion = "24.11";

 imports = [
  ./browsers/chromium.nix
  ./browsers/librewolf.nix
  ./browsers/torbrowser.nix
  ./desktop/default.nix
  ./editors/default.nix
  ./others/default.nix
  ./terminal/default.nix
 ];

 nixpkgs.config.allowUnfree = true;

 home.sessionVariables = {
  XDG_CURRENT_DESKTOP = "Hyprland";
  XDG_SESSION_TYPE = "wayland";
  XDG_SESSION_DESKTOP = "Hyprland";
  GDK_SCALE = "1.25";
  QT_QPA_PLATFORM = "wayland";
  XDG_SCREENSHOTS_DIR,~/screens;
  MOZ_ENABLE_WAYLAND = "1";
  ROFI_WAYLAND = "1";
  WLR_NO_HARDWARE_CURSORS = "1";
  XCURSOR_SIZE = "18";
 };
 
 home.packages = with pkgs; [
  jetbrains-mono
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-emoji
  nerd-fonts.fira-code
  nerd-fonts.droid-sans-mono
  font-manager
 ];

 fonts.fontconfig.enable = true;

 programs.home-manager.enable = true;
}
