{ pkgs, ... }:

{

 programs.waybar = {
  enable = true;
  style = ./style.css;
  settings = {
   top_bar = {
    modules-left = ["hyprland/workspaces"];
    modules-right = ["tray" "clock" "pulseaudio" "battery"];

    "clock" = {
     tooltip = false;
     format = " {:%H:%M} ";
    };

    "hyprland/workspaces" = {
     on-click = "activate";
     persistent-workspaces = {
      "*" = 5;
     };
    };

    "battery" = {
     tooltip = false;
     states = {
      warning = 30;
      critical = 15;
     };
     format = " {capacity}% {icon} ";
     format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
     format-plugged = " {capacity}%  ";
     format-charging = " {capacity}%  ";
     interval = 15;
    };

    "tray" = {
     icon-size = 15;
     spacing = 5;
    };

    "pulseaudio" = {
     tooltip = false;
     on-click = "pwvucontrol";
     format = " {volume}% {icon} ";
     format-muted = " 󰝟 ";
     format-icons = { default = ["󰕿" "󰖀" "󰕾"]; };   
    };
   };
  }; 
 };

}
