{ pkgs, ... }:

{

 wayland.windowManager.hyprland = {
  extraConfig = ''
   bind = , Print, exec, grim -g "$(slurp)" - | wl-copy 
   '';
  settings = {
   bind = [
    "$mod, Q, exec, $terminal"
    "$mod, C, killactive"
    "$mod, G, togglefloating"
    "$mod, F, fullscreen"
    "$mod, R, exec, rofi -show drun"
    "$mod, E, exec, rofi -show emoji"
    "$mod, W, exec, rofi -show window"
    "$mod, M, exec, rofi -show power-menu -modi power-menu:rofi-power-menu"
    "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
    "$mod SHIFT, V, exec, cliphist wipe"
    "$mod, Tab, focuscurrentorlast"

    "$mod SHIFT, P, pass, class:^(com\.obsproject\.Studio)$"
    
    "$mod CTRL, h, resizeactive, -20 0"
    "$mod CTRL, l, resizeactive, 20 0"
    "$mod CTRL, k, resizeactive, 0 -20"
    "$mod CTRL, j, resizeactive, 0 20"
    "$mod CTRL, left, resizeactive, -20 0"
    "$mod CTRL, right, resizeactive, 20 0"
    "$mod CTRL, up, resizeactive, 0 -20"
    "$mod CTRL, down, resizeactive, 0 20"
    
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
   
    "$mod, h, movefocus, l"
    "$mod, l, movefocus, r"
    "$mod, k, movefocus, u"
    "$mod, j, movefocus, d"
    "$mod, left, movefocus, l"
    "$mod, right, movefocus, r"
    "$mod, up, movefocus, u"
    "$mod, down, movefocus, d"

    "$mod, mouse_down, workspace, e-1"
    "$mod, mouse_up, workspace, e+1"

    ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ",XF86AudioNext, exec, playerctl next"
    ",XF86AudioPrev, exec, playerctl previous"
    ",XF86AudioPause, exec, playerctl play-pause"
    ",XF86AudioPlay, exec, playerctl play-pause"
    ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
    ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"

    ", switch:Lid Switch, exec, pidof hyprlock || hyprlock"
   ];

   bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
   ];
  };
 };

}
  
