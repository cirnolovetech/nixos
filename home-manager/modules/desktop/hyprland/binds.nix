{
 wayland.windowManager.hyprland.settings = {
  bind = [
   "$mod, q, exec, $terminal"
   "$mod SHIFT, q, killactive"
   "$mod SHIFT, m, exit"
   "$mod SHIFT, r, exec, hyprctl reload"

   "$mod, g, togglefloating"
   "$mod, f, fullscreen"
   "$mod, RETURN, exec, wofi --show run"
   "$mod, tab, focuscurrentorlast"

   "$mod CTRL, h, resizeactive, -20 0"
   "$mod CTRL, l, resizeactive, 20 0"
   "$mod CTRL, k, resizeactive, 0 -20"
   "$mod CTRL, j, resizeactive, 0 20"

   "$mod, 1, workspace, 1"
   "$mod, 2, workspace, 2"
   "$mod, 3, workspace, 3"
   "$mod, 4, workspace, 4"
   "$mod, 5, workspace, 5"
   "$mod, 6, workspace, 6"
   "$mod, 7, workspace, 7"
   "$mod, 8, workspace, 8"
   "$mod, 9, workspace, 9"

   "$mod SHIFT, 1, movetoworkspace,1"
   "$mod SHIFT, 2, movetoworkspace,2"
   "$mod SHIFT, 3, movetoworkspace,3"
   "$mod SHIFT, 4, movetoworkspace,4"
   "$mod SHIFT, 5, movetoworkspace,5"
   "$mod SHIFT, 6, movetoworkspace,6"
   "$mod SHIFT, 7, movetoworkspace,7"
   "$mod SHIFT, 8, movetoworkspace,8"
   "$mod SHIFT, 9, movetoworkspace,9"

   "$mod, h, movefocus, l"
   "$mod, l, movefocus, r"
   "$mod, k, movefocus, u"
   "$mod, j, movefocus, d"

   "$mod, RETURN, exec, wofi --show run"

   "SHIFT, PRINT, exec, hyprshot -m window -o ~/Pictures/Screenshots"
   "$mod,  PRINT, exec, hyprshot -m output -o ~/Pictures/Screenshots"
   ",  	  PRINT, exec, hyprshot -m region -o ~/Pictures/Screenshots"
  ];

  bindm = [
   "$mod, mouse:272, movewindow"
   "$mod, mouse:273, resizewindow"
  ];

  bindel = [
   ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
   ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
   ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
   ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
   ", XF86MonBrightnessUp, exec, brightnessctl set 10%+"
   ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
  ];

  bindl = [
   ", switch:Lid Switch, exec, pidof hyprlock || hyprlock"
   ", XF86AudioNext, exec, playerctl next"
   ", XF86AudioPrev, exec, playerctl previous"
   ", XF86AudioPause, exec, playerctl play-pause"
   ", XF86AudioPlay, exec, playerctl play-pause"
  ];
}
