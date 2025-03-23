{ pkgs, ... }:

{

 programs.waybar = {
  enable = true;
  style = ./style.css;
  settings = {
   top_bar = {
    layer = "top";
    position = "top";
    height = 30;
    width = 1520;
    margin-top = 5;
    spacing = 0;
    modules-left = ["custom/distro" "hyprland/workspaces"];
    modules-center = [];
    modules-right = ["tray" "pulseaudio" "battery" "clock"];
    
    "custom/distro" = {
     tooltip = false;
     format = "  ";
    };
    
    "clock" = {
     tooltip = false;
     format = " {:%H:%M} ";
    };

    "hyprland/workspaces" = {
     on-click = "activate";
     format = "<span font='12'>{icon}</span>";
     format-icons = {
      active = "";
      default = "";
      empty = "";
     };
     persistent-workspaces = {
      "*" = 5;
     };
    };

    "battery" = {
     tooltip = false;
     states = {
      good = 90;
      warning = 30;
      critical = 15;
     };
     format = " {capacity}% <span font='12'>{icon}</span> ";
     format-plugged = " {capacity}% <span font='12'></span> ";
     format-charging = " {capacity}% <span font='12'></span> ";
     format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    };

    "tray" = {
     icon-size = 16;
     spacing = 5;
    };

    "pulseaudio" = {
     tooltip = false;
     on-click = "pwvucontrol";
     format = " {volume}% <span font='12'>{icon}</span> ";
     format-muted = " <span font='12'>󰝟</span> ";
     format-icons = { default = ["󰕿" "󰖀" "󰕾"]; };   
    };
   };
  }; 
 };

}
