{ pkgs, ... }:

{

 programs.waybar = {
  enable = true;
  style = ./Style.css;
  settings = {
   top_bar = {
    layer = "top";
    position = "top";
    height = 32;
    spacing = 4;
    modules-left = [ "custom/distro" "clock" ];
    modules-center = [ "hyprland/workspaces" ];
    modules-right = [ "tray" "pulseaudio" "battery" ];
    
    "custom/distro" = {
     tooltip = false;
     format = "  ";
    };
    
    "clock" = {
     tooltip = false;
     format = "{:%H:%M}";
    };

    "hyprland/workspaces" = {
     on-click = "activate";
     format = "<span font='14'>{icon}</span>";
     persistent-workspaces = {
      "*" = 10;
     };
    };

    "battery" = {
     tooltip = false;
     format = " <span font='14'>{icon}</span> {capacity}% ";
     format-charging = " <span font='14'>󰂄</span> {capacity}% ";
     format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    };

    "tray" = {
     icon-size = 18;
     spacing = 10;
    };

    "pulseaudio" = {
     tooltip = false;
     format = " <span font='14'>󰕾</span> {volume}% ";
     on-click = "pwvucontrol";
    };
   };
  }; 
 };

}
