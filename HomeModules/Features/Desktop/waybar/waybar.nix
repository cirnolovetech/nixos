{ pkgs, ... }:

{
 programs.waybar = {
  enable = true;
  systemd.enable = false;
  style = ./style.css;
  settings = {
   top_bar = {
    position = "top";
    height = 20;

    modules-left = [ "clock" ];
    modules-right = [ "tray" "custom/separator" "wireplumber" "custom/separator" "battery" ];
    
    "clock" = {
     tooltip = false;
     format =  "{:%H : %M}";
    };

    "tray" = {
     icon-size = 15;
     spacing = 1;
    };

    "wireplumber" = {
     tooltip = false; 
     format = "{volume}% {icon}";
     format-muted = "󰝟";
     format-icons = ["" "" ""];
     on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
     scroll-step = 5;
    };

    "custom/separator" = {
     tooltip = false;
     format = " · ";
    };

    "battery" = {
     tooltip = false;
     format = "{capacity}% {icon}";
     format-icons = {
      "charging" = ["󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
      "default" = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
     };
     format-full = "{capacity}% 󰂅";
     interval = 5;
    };
   };
  }; 
 };
}
