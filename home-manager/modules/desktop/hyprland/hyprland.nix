{ pkgs, ... }:

{
 wayland.windowManager.hyprland = {
  enable = true;
  systemd.enable = false;

  extraConfig = ''
   bind = , Print, exec, grim -g "$(slurp)" - | wl-copy | dunstify "Screenshot of the region copied" -t 1000 # screenshot of a region
   bind = SUPER, Print, exec, grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of whole screen saved" -t 1000 # screenshot of the whole screen
    '';
  settings = { 
   monitor = ", preferred, auto, 1.2";
  
   # Alias
   "$terminal" = "kitty";
   "$mod" = "SUPER";  
   
   # Startup
   exec-once = [
    "waybar"
    "fcitx5"
    "nm-applet --indicator"
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"
   ];
  
   # X11 
   xwayland = {
    force_zero_scaling = true;
   };
   
   # Keyboard and Touchpad
   input = {
    kb_layout = "us";
    follow_mouse = 1;
    touchpad = {
     tap-and-drag = true;
     natural_scroll = true;
    };
    sensitivity = 0;
   };

   # Layout
   general = {
    layout = "master";
    gaps_in = 5;
    gaps_out = 5;
    border_size = 2;
    allow_tearing = false;
   };
  
  # Decoration
   decoration = {
    rounding = 10;
    active_opacity = 1.0;
    inactive_opacity = 0.9;
    fullscreen_opacity = 0.9;
   };
   
   # Animation
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
   
   # Key Binds
   bind = [
    # General
    "$mod, Q, exec, $terminal"
    "$mod, E, exec, dolphin"
    "$mod, C, killactive"
    "$mod, M, exit"
    "$mod, G, togglefloating"
    "$mod, F, fullscreen"
    "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
    "$mod, R, exec, rofi -show drun"
    "$mod, tab, focuscurrentorlast"
    
    # Resize Window
    "$mod CTRL, h, resizeactive, -20 0"
    "$mod CTRL, l, resizeactive, 20 0"
    "$mod CTRL, k, resizeactive, 0 -20"
    "$mod CTRL, j, resizeactive, 0 20"

    # Workspaces
    "$mod, 1, workspace,  1"
    "$mod, 2, workspace,  2"
    "$mod, 3, workspace,  3"
    "$mod, 4, workspace,  4"
    "$mod, 5, workspace,  5"
    "$mod, 6, workspace,  6"
    "$mod, 7, workspace,  7"
    "$mod, 8, workspace,  8"
    "$mod, 9, workspace,  9"
    "$mod, 0, workspace, 10"
   
    # Move to Workspace
    "$mod SHIFT, 1, movetoworkspace,  1"
    "$mod SHIFT, 2, movetoworkspace,  2"
    "$mod SHIFT, 3, movetoworkspace,  3"
    "$mod SHIFT, 4, movetoworkspace,  4"
    "$mod SHIFT, 5, movetoworkspace,  5"
    "$mod SHIFT, 6, movetoworkspace,  6"
    "$mod SHIFT, 7, movetoworkspace,  7"
    "$mod SHIFT, 8, movetoworkspace,  8"
    "$mod SHIFT, 9, movetoworkspace,  9"
    "$mod SHIFT, 0, movetoworkspace, 10"
   
    # Change Focused Window
    "$mod, h, movefocus, l"
    "$mod, l, movefocus, r"
    "$mod, k, movefocus, u"
    "$mod, j, movefocus, d"

    # Workspace Scrolling
    "$mod, mouse_down, workspace, e-1"
    "$mod, mouse_up, workspace, e+1"
   
    # Audio Control
    ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    
    # Media Control
    ",XF86AudioNext, exec, playerctl next"
    ",XF86AudioPrev, exec, playerctl previous"
    ",XF86AudioPause, exec, playerctl play-pause"
    ",XF86AudioPlay, exec, playerctl play-pause"

    # Brightness Control
    ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
    ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"

    # Laptop Lid
    ", switch:Lid Switch, exec, pidof hyprlock || hyprlock"
   ];

   # Mouse Binds
   bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
   ];
   
   # Environment Variables
   env = [
    "XDG_CURRENT_DESKTOP,Hyprland"
    "XDG_SESSION_TYPE,wayland"
    "XDG_SESSION_DESKTOP,Hyprland"
    "QT_QPA_PLATFORM,wayland"
    "MOZ_ENABLE_WAYLAND, 1"
    "ROFI_WAYLAND, 1"
    "WLR_NO_HARDWARE_CURSORS, 1"
    "XCURSOR_SIZE, 18"
    "GDK_SCALE, 1.25"
   ];
  };
 };
}
