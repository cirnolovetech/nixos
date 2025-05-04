{ pkgs, ... }:

{
 programs.waybar = {
  enable = true;
  systemd.enable = false;
  style = ./Style.css;
  settings = {
   top_bar = {
    layer = "top";
    position = "top";
    spacing = 0;
    height = 34;

    modules-left = [ "hyprland/workspaces" ];
    modules-center = [ "clock" ];
    modules-right = [ "tray" "wireplumber" "battery" ];
     
    "hyprland/workspaces" = {
     on-click = "activate";
     format-icons = {
      "1" = "1";
      "2" = "2";
      "3" = "3";
      "4" = "4";
      "5" = "5";
      "6" = "6";
      "7" = "7";
      "8" = "8";
      "9" = "9";
      "10" = "10";
     };
     persistent-workspaces = {
      "*" = 5; 
     };
    };

    "clock" = {
     tooltip-format = "{calendar}";
     format =  "  {:%I:%M %p}";
     format-alt = "  {:%a, %d %b %Y}";
    };

    "tray" = {
     spacing = 5;
    };

    "wireplumber" = {
     format = "{icon}";
     format-bluetooth = "󰂰";
     nospacing = 1;
     tooltip-format = "Volume : {volume}%";
     format-muted = "󰝟";
     format-icons = {
      "headphone" = "";
      "default" = ["󰖀" "󰕾" ""];
     };
     on-click = "pwvucontrol";
     scroll-step = 1;
    };

    "battery" = {
     tooltip = false;
     format = "{capacity}% {icon}";
     format-icons = {
      "charging" = ["󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
      "default" = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
     };
     format-full = "Charged ";
     interval = 5;
     states = {
      warning = 30;
      critical = 10;
     };
    };
   };
  }; 
 };
}
