{ pkgs, ... }:

{
 
 imports = [
  ./hypridle.nix
  ./hyprlock.nix
  ./hyprpapr.nix
  ./keybinds.nix
 ];

 wayland.windowManager.hyprland = {
  enable = true;
  systemd.enable = false;
  settings = { 
   monitor = "eDP-1, 1920x1080@144, 0x0, 1.25";
  
   "$terminal" = "kitty";
   "$mod" = "SUPER";  
   
   exec-once = [
    "waybar"
    "fcitx5"
    "nm-applet --indicator"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
   ];
  
   xwayland = {
    force_zero_scaling = true;
   };
   
   input = {
    kb_layout = "us";
    follow_mouse = 1;
    touchpad = {
     tap-and-drag = true;
     natural_scroll = true;
    };
    sensitivity = 0;
   };

   general = {
    layout = "master";
    gaps_in = 5;
    gaps_out = 10;
    border_size = 2;
    allow_tearing = false;
    "col.active_border" = "rgb(eeeeee)";
    "col.inactive_border" = "rgb(1a1a1a)";
   };
  
   decoration = {
    rounding = 0;
   };
   
   animations = {
    enabled = true;
    bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
    animation = [
     "windows, 1, 2, myBezier"
     "windowsOut, 1, 2, default, popin 80%"
     "border, 1, 3, default"
     "fade, 1, 2, default"
     "workspaces, 1, 1, default"
    ];
   };

   env = [
    "XDG_CURRENT_DESKTOP,Hyprland"
    "XDG_SESSION_TYPE,wayland"
    "XDG_SESSION_DESKTOP,Hyprland"
    "QT_QPA_PLATFORM,wayland"
    "MOZ_ENABLE_WAYLAND,1"
    "ROFI_WAYLAND,1"
    "WLR_NO_HARDWARE_CURSORS,1"
    "XCURSOR_SIZE,24"
    "GDK_SCALE,1.25"
    "OZONE_WAYLAND=1"
   ];

   windowrulev2 = [
    "opaque, class:^(libreoffice)$"
    "opaque, class:^(libreoffice-writer)$"
    "opaque, class:^(libreoffice-calc)$"
    "opaque, class:^(libreoffice-base)$"
    "opaque, class:^(libreoffice-draw)$"
    "opaque, class:^(libreoffice-impress)$"
    "opaque, class:^(libreoffice-math)$"
    "float, class:^(mpv)$"
    "float, class:^(obsidian)$"
   ];
  };
 };

 home.packages = with pkgs; [
  xclip
  wl-clipboard 
  hyprshot
  hyprpicker
  pwvucontrol
  libnotify
  brightnessctl
 ];

}
