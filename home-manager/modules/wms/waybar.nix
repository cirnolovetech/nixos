{
 programs.waybar = {
  enable = true;
  settings = {
   mainBar = {
    layer = "top";
    position = "top";
    modules-left = ["hyprland/workspaces"];
    modules-center = [ ];
    modules-right = ["tray" "pulseaudio" "battery" "clock"];

 "hyprland/workspaces" = {
  disable-scroll = true;
  active-only = false;
  format = "{icon}";
  all-outputs = true;
  format-icons = {
   "1" = "󰈹";
   "2" = "󰙯";
   "3" = "󰂺";
   "4" = "";
   "5" = "";
   "6" = "󰊖";
  };
 };

 "clock" = {
  format = "{:%H:%M}";
  tooltip-format = "{:%d %b | %H:%M}";
 };

 "pulseaudio" = {
  format = "{icon} {volume}%";
  format-bluetooth = "{icon} {volume}%{icon}";
  format-muted = "";
  format-icons = {
   "headphones" = "";
   "handsfree" = "";
   "headset" = "";
   "phone" = "";
   "portable" = "";
   "car" = "";
   "default" = ["" ""];
  };
  on-click = "pwvucontrol";
 };

 battery = {
  format = "{icon} {capacity}%";
  format-charging = "󱐋 {capacity}%";
  format-icons = [ "" "" "" "" "" ];
  states = {
   critical = 15;
   warning = 30;
  };
 };

  tray = {
   icon-size = 16;
   spacing = 0;
  };

   };
 };

 style =
      ''
* {
    border: none;
    border-radius: 0px;
    font-family: Fira Mono Nerd Font;
    font-weight: bold;
    font-size: 16px;
    min-height: 0px;
    color: #ffffff;
}

window#waybar {
    background: #1d2021;
}

#workspaces button label{
  color: #ffffff;
  padding: 0 5px;
}

#workspaces button.active label {
  color: #ffffff;
}

#workspaces button.active {
  background: #45acff;
}

#clock, #battery, #pulseaudio, #tray {
  padding: 0 10px;
  margin: 0 0px;
  color: #ffffff;
}

#pulseaudio.muted {
  padding: 0 10px;
  color: #cc241d;
}
      '';
  };
}
