{ config, pkgs, ... }:

{
  # Information
  home.username = "cirno";
  home.homeDirectory = "/home/cirno";

  # Version
  home.stateVersion = "24.05";

  # Packages
  home.packages = [ ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      # Monitor
      monitor = [
       "eDP-1,1920x1200@144, 0x0, 1.25"
      ];

      # Default
       "$mod" = "SUPER";
       "$terminal" = "kitty";
       "$fileManager" = "dolphin";

      # Startup
      exec-once = [
       "waybar"
       "dunst"
       "fcitx5"
       "firefox"
       "vesktop"
      ];

      # Xwayland
       xwayland = {
         force_zero_scaling = true;
       };

      # Tiling
       general = {
         gaps_in = "6";
         gaps_out = "6";
         border_size = "2";
         layout = "master";
         allow_tearing = true;
       };

      # Keyboard & Touchpad
       input = {
         kb_layout = "us";
         kb_options = "caps:super";
         follow_mouse = true;
         touchpad = {
           natural_scroll = false;
         };
         accel_profile = "flat";
         sensitivity = "0";
       };

       # Decoration
       decoration = {
         rounding = "0";
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
           "$mod, c, killactive"
           "$mod, m, exit"
           "$mod, q, exec, kitty"
           "$mod, e, $fileManager"
           "$mod, b, exec, firefox"

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

           # Move to workspaces
           "$mod SHIFT, 1, movetoworkspace,1"
           "$mod SHIFT, 2, movetoworkspace,2"
           "$mod SHIFT, 3, movetoworkspace,3"
           "$mod SHIFT, 4, movetoworkspace,4"
           "$mod SHIFT, 5, movetoworkspace,5"

           # Navigation
           "$mod, left, movefocus, l"
           "$mod, right, movefocus, r"
           "$mod, up, movefocus, u"
           "$mod, down, movefocus, d"

           # Applications Launcher
           "$mod, r, exec, fuzzel"

           # Screencapture
           ",Print, exec, grimblast copysave area /home/cirno/Pictures/Screenshots"
           ", SHIFT, Print, exec, grimblast copysave active /home/cirno/Pictures/Screenshots"
           "$mod, Print, exec, grimblast copysave screen /home/cirno/Pictures/Screenshots"
        ];

         bindm = [
           # Move/Resize Windows
           "$mod, mouse:272, movewindow"
           "$mod, mouse:273, resizewindow"
           "$mod, ALT, mouse:272, resizewindow"
        ];

         bindl = [
           # Laptop Multimedia Keys
           ", XF86AudioNext, exec, playerctl next"
           ", XF86AudioPause, exec, playerctl play-pause"
           ", XF86AudioPlay, exec, playerctl play-pause"
           ", XF86AudioPrev, exec, playerctl previous"
        ];

         bindel = [
           # Laptop volume and LCD brightness keys
           ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
           ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
           ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
           ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
           ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
           ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ];
    };
 };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
       layer = "top";
       position = "top";
       output = [
         "eDP-1"
      ];
    modules-left = [ "clock" ];
    modules-center = [ "hyprland/workspaces" ];
    modules-right = [ "wireplumber" "network" "battery" ];
   };
  };
 };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status \n $username$hostname$directory";
      character = {
        success_symbol = "[](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "chillinwithmao";
    userEmail = "chillinwithmao@gmail.com";
  };

  # Managing Dotfiles
  home.file = {

  };

  # Environment Variables
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Home Manager
  programs.home-manager.enable = true;
}
