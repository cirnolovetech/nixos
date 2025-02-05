{
 programs.waybar = {
  enable = true;
  settings = {
   mainBar = {
    layer = "top";
    position = "top";
    margin = "5 5 -5 5";

    modules-left = [ "hyprland/workspaces" ];
    modules-center = [ "clock" ];
    modules-right = [ "tray" "wireplumber" "battery" ];

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
  format = "{:%HH:%MM}";
  tooltip-format = " {:%a; %d %b, %I:%M %p}";
 };

 "wireplumber" = {
  reverse-scrolling = 1;
  format = "{volume}% {icon} {format_source}";
  format-bluetooth = "{volume}% {icon} {format_source}";
  format-bluetooth-muted = " {icon} {format_source}";
  format-muted = " {format_source}";
  format-source = "{volume}% ";
  format-source-muted = "";
  format-icons = {
   headphone = "";
   hands-free = "";
   headset = "";
   phone = "";
   portable = "";
   car = "";
   default = ["" "" ""];
  };
  on-click = "pwvucontrol";
  min-length = 13;
 };

 battery = {
  format = "{capacity}% {icon}";
  format-alt = "{time} {icon}";
  format-charging = "{capacity}% 󱐋";
  format-icons = [ "" "" "" "" "" ];
  format-plugged = "{capacity}% 󱐋";
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
    border-radius: 0;
    font-family: Fira Mono Nerd Font;
    font-weight: bold;
    min-height: 20px;
}

window#waybar {
    background: transparent;
}

window#waybar.hidden {
    opacity: 0.2;
}

#workspaces {
    margin-right: 8px;
    border-radius: 10px;
    transition: none;
    background: #1d1d1f;
}

#workspaces button {
    transition: none;
    color: #7c818c;
    background: transparent;
    padding: 5px;
    font-size: 18px;
}

#workspaces button.persistent {
    color: #7c818c;
    font-size: 12px;
}

#workspaces button:hover {
    transition: none;
    box-shadow: inherit;
    text-shadow: inherit;
    border-radius: inherit;
    color: #1d1d1f;
    background: #7c818c;
}

#workspaces button.active {
    background: #4e5263;
    color: white;
    border-radius: inherit;
}

#clock {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px 10px 10px 10px;
    transition: none;
    color: #ffffff;
    background: #1d1d1f;
}

#wireplumber {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #1d1d1f;
}

#wireplumber.muted {
    background-color: #90b1b1;
    color: #2a5c45;
}

#custom-mem {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #1d1d1f;
}

#battery {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #1d1d1f;
}

#battery.charging {
    color: #ffffff;
    background-color: #26A65B;
}

#battery.warning:not(.charging) {
    background-color: #ffbe61;
    color: black;
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#tray {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #1d1d1f;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}
      '';
  };
}
