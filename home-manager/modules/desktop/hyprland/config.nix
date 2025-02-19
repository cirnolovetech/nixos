{ inputs, outputs, lib, config, pkgs, ... }:

{
 imports = [
  ./binds.nix
  ./hyprlock.nix
  ./hypridle.nix
 ];

 wayland.windowManager.hyprland = {
  enable = true;
  settings = {
   monitor = [
    "eDP-1,1920x1080@144, 0x0, 1.25"
   ];

   "$terminal" = "kitty";
   "$mod" = "SUPER";

   exec-once = [
    "waybar"
    "swww-daemon"
    "sleep 1; swww img ~/.config/home-manager/modules/Wallpaper.jpeg"
    "fcitx5"
   ];

   xwayland = {
    force_zero_scaling = true;
   };

   general = {
    layout = "master";
    gaps_in = 1;
    gaps_out = 3;
    border_size = 3;
    allow_tearing = false;
    "col.active_border" = "rgba(81a1c1ff)";
    "col.inactive_border" = "rgba(3b4252ff)";
   };

   input = {
    kb_layout = "us";
    follow_mouse = true;

    touchpad = {
     natural_scroll = false;
    };

    sensitivity = 0;
   };

   decoration = {
    rounding = 10;
   };

   animations = {
    bezier = [
     "linear, 0, 0, 1, 1"
     "md3_standard, 0.2, 0, 0, 1"
     "md3_decel, 0.05, 0.7, 0.1, 1"
     "md3_accel, 0.3, 0, 0.8, 0.15"
     "overshot, 0.05, 0.9, 0.1, 1.1"
     "crazyshot, 0.1, 1.5, 0.76, 0.92"
     "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
     "menu_decel, 0.1, 1, 0, 1"
     "menu_accel, 0.38, 0.04, 1, 0.07"
     "easeInOutCirc, 0.85, 0, 0.15, 1"
     "easeOutCirc, 0, 0.55, 0.45, 1"
     "easeOutExpo, 0.16, 1, 0.3, 1"
     "softAcDecel, 0.26, 0.26, 0.15, 1"
     "md2, 0.4, 0, 0.2, 1"
    ];
    animation = [
     "windows, 1, 3, md3_decel, popin 60%"
     "windowsIn, 1, 3, md3_decel, popin 60%"
     "windowsOut, 1, 3, md3_accel, popin 60%"
     "border, 1, 10, default"
     "fade, 1, 3, md3_decel"
     "layersIn, 1, 3, menu_decel, slide"
     "layersOut, 1, 1.6, menu_accel"
     "fadeLayersIn, 1, 2, menu_decel"
     "fadeLayersOut, 1, 4.5, menu_accel"
     "workspaces, 1, 7, menu_decel, slide"
     "specialWorkspace, 1, 3, md3_decel, slidevert"
    ];
   };

   env = [
    "XDG_CURRENT_DESKTOP,Hyprland"
    "XDG_SESSION_TYPE,wayland"
    "XDG_SESSION_DESKTOP,Hyprland"
    "GDK_SCALE,1.25"
    "QT_QPA_PLATFORM,wayland"
    "XDG_SCREENSHOTS_DIR,~/screens"
   ];
   };
  };
}
