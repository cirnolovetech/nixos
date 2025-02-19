{
 programs.waybar = {
  enable = true;
  settings = {
   mainBar = {
    layer = "top";
    position = "top";
    modules-left = [ "clock" "tray" ];
    modules-center = [ "hyprland/workspaces" ];
    modules-right = [ "pulseaudio" "battery" ];
 
 "hyprland/workspaces" = {
  disable-scroll = true;
  active-only = false;
  format = "{icon}";
  all-outputs = true;
  format-icons = {
   "active" = "";
   "default" = ""; 
  };
  "persistent-workspaces" = {
   "*" = 6;
  };
 };

 "clock" = {
  format = "{:%H:%M}";
  tooltip-format = "{:%d %b | %H:%M}";
 };

 "pulseaudio" = {
  format = "{volume}% {icon}";
  format-muted = "󰟎";
  format-icons = "󰋋";
  on-click = "pwvucontrol";
 };

 battery = {
  format = "{capacity}% {icon}";
  format-charging = "{capacity}% 󱐋";
  format-icons = [ "󰁺" "󰁼" "󰁾" "󰂁" "󰁹" ];
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
    font-size: 12px;
    min-height: 0px;
    color: #eceff4;
}

window#waybar {
    background: #2e3440;
}

#workspaces {
    border: 1px solid #eceff4;
    transition: none;
    background: #2e3440;
} 

#workspaces button {
    transition: none;
    color: #eceff4;
    background: transparent;
    padding: 5px;
    font-size: 18px;
}

#workspaces button.persistent {
    color: #eceff4;
    font-size: 12px;
}

#workspaces button:hover {
    transition: none;
    color: #eceff4;
    background: #2e3440;
}

#workspaces button.active {
    background: transparent;
    color: #eceff4;
}

#clock, #battery, #pulseaudio, #tray {
    padding: 0 2px;
    margin-right: 3px;
    margin-left: 3px;
    color: #eceff4;
    border: 1px solid #eceff4;
    background: #3b4252;
}

#pulseaudio.muted {
    padding: 0 10px;
}  
   '';
  };
}
