{ inputs, outputs, lib, config, pkgs, ... }:

{
wayland.windowManager.hyprland = {
 enable = true;
 settings = {
  # Monitor (Current Laptop)
  monitor = [
   "eDP-1,1920x1200@144, 0x0, 1.25"
  ];

  # Default
  "$terminal" = "kitty";
  "$mod" = "SUPER";

  # Autostart Applications
  exec-once = [
   "hyprpaper"
   "fcitx5" 
  ];

  # X11 Apps No Scaling
  xwayland = {
   force_zero_scaling = true;
  };

  # Layout
  general = {
   layout = "master";
   gaps_in = 5;
   gaps_out = 10;
   border_size = 2;
   resize_on_border = true;
   allow_tearing = false;
   "col.active_border" = "rgba(358dfbff)";
   "col.inactive_border" = "rgba(1d1d1fff)";
  };

  # Keyboard
  input = {
   kb_layout = "us";
   follow_mouse = true;

  # Touchpad
  touchpad = {
    natural_scroll = false;
   };

  # Mouse
   sensitivity = 0;
  };

  # Decoration
  decoration = {
   rounding = 10;
   active_opacity = 1;
   inactive_opacity = 1;
   fullscreen_opacity = 1;
  };

  # Animation
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

  # Keybinds
  bind = [
   # General
   "$mod, q, exec, $terminal"
   "$mod SHIFT, exec, waybar"
   "$mod, c, killactive"
   "$mod SHIFT, c, exit"
   "$mod SHIFT, r, exec, hyprctl reload"

   # Screen focus
   "$mod, v, togglefloating"
   "$mod, u, focusurgentorlast"
   "$mod, tab, focuscurrentorlast"
   "$mod, f, fullscreen"

   # Screen resize
   "$mod CTRL, left, resizeactive, -20 0"
   "$mod CTRL, right, resizeactive, 20 0"
   "$mod CTRL, up, resizeactive, 0 -20"
   "$mod CTRL, down, resizeactive, 0 20"

   # Workspaces
   "$mod, 1, workspace, 1"
   "$mod, 2, workspace, 2"
   "$mod, 3, workspace, 3"
   "$mod, 4, workspace, 4"
   "$mod, 5, workspace, 5"
   "$mod, 6, workspace, 6"

   # Move to workspaces
   "$mod SHIFT, 1, movetoworkspace,1"
   "$mod SHIFT, 2, movetoworkspace,2"
   "$mod SHIFT, 3, movetoworkspace,3"
   "$mod SHIFT, 4, movetoworkspace,4"
   "$mod SHIFT, 5, movetoworkspace,5"
   "$mod SHIFT, 6, movetoworkspace,6"

   # Navigation
   "$mod, left, movefocus, l"
   "$mod, right, movefocus, r"
   "$mod, up, movefocus, u"
   "$mod, down, movefocus, d"

   # Applications
   "$mod, RETURN, exec, wofi --show run"

   # Screencapture
   ",      PRINT, exec, hyprshot -m window -o ~/Pictures/Screenshots"
   "$mod,  PRINT, exec, hyprshot -m output -o ~/Pictures/Screenshots"
   "SHIFT, PRINT, exec, hyprshot -m region -o ~/Pictures/Screenshots"
  ];

  # Mousebinds
  bindm = [
   "$mod, mouse:272, movewindow"
   "$mod, mouse:273, resizewindow"
  ];

  # Laptop Binds P.1
  bindel = [
   ", XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
   ", XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
   ", XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
   ", XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
   ", XF86MonBrightnessUp,   exec, brightnessctl set 10%+"
   ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
  ];

  # Laptop Binds P.2
  bindl = [
   ",switch:Lid Switch, exec, ${lib.getExe' pkgs.procps "pidof"} hyprlock || hyprlock"
   ", XF86AudioNext,  exec, playerctl next"
   ", XF86AudioPrev,  exec, playerctl previous"
   ", XF86AudioPause, exec, playerctl play-pause"
   ", XF86AudioPlay,  exec, playerctl play-pause"
  ];

   # Env var
   env = [
    "XDG_CURRENT_DESKTOP,Hyprland"
    "XDG_SESSION_TYPE,wayland"
    "XDG_SESSION_DESKTOP,Hyprland"
    "XCURSOR_SIZE,36"
    "QT_QPA_PLATFORM,wayland"
    "XDG_SCREENSHOTS_DIR,~/screens"
   ];
   };
  };
}
