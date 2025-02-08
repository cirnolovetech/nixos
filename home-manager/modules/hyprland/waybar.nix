{
 programs.waybar = {
  enable = true;
  settings = {
   mainBar = {
    layer = "top";
    position = "top";
    margin = "5 5 -5 5px";
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
    font-size: 16px;
    min-height: 0px;
    color: #eceff4;
}

window#waybar {
    background: transparent;
}

#workspaces {
    border-radius: 5px;
    transition: none;
    background: #1d1d1f;
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
    font-size: 16px;
}

#workspaces button:hover {
    transition: none;
    box-shadow: inherit;
    text-shadow: inherit;
    border-radius: inherit;
    color: #eceff4;
    background: #1d1d1f;
}

#workspaces button.active {
    background: transparent;
    color: #eceff4;
    border-radius: inherit;
}

#clock, #battery, #pulseaudio, #tray {
    padding: 0 5px;
    margin-right: 5px;
    margin-left: 5px;
    color: #eceff4;
    border-radius: 5px;
    background: #1d1d1f;
}

#pulseaudio.muted {
    padding: 0 10px;
}  
   '';
  };
}
