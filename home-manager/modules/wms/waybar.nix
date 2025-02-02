{
 programs.waybar = {
  enable = true;
  settings = {
   mainBar = {
    layer = "top";
    position = "top";
    margin = "9 13 -10 18";

    modules-left = ["hyprland/workspaces" "hyprland/language" "keyboard-state" "hyprland/submap"];
    modules-center = ["clock" "custom/weather"];
    modules-right = ["wireplumber" "backlight" "battery" "tray"];

 "hyprland/workspaces" = {
  disable-scroll = true;
 };

 "hyprland/language" = {
  format-en = "US";
  format-vn = "VN";
  min-length = 5;
  tooltip = false;
 };

 "keyboard-state" = {
  #numlock = true;
  capslock = true;
  format = "{icon} ";
  format-icons = {
  locked = " ";
  unlocked = "";
  };
 };

 "clock" = {
  # timezone = "Vietnam/Saigon";
  tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
  format = "{:%a; %d %b, %I:%M %p}";
 };

 "wireplumber" = {
  # scroll-step = 1; # %, can be a float
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

 "backlight" = {
  device = "intel_backlight";
  format = "{percent}% {icon}";
  format-icons = [""];
  min-length = 7;
 };

 battery = {
  states = {
   warning = 30;
   critical = 15;
  };
  format = "{capacity}% {icon}";
  format-charging = "{capacity}% ";
  format-plugged = "{capacity}% ";
  format-alt = "{time} {icon}";
  format-icons = ["" "" "" "" "" "" "" "" "" ""];
  on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
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
    font-family: JetBrains Mono;
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
    background: #383c4a;
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
    color: #383c4a;
    background: #7c818c;
}

#workspaces button.active {
    background: #4e5263;
    color: white;
    border-radius: inherit;
}

#language {
    padding-left: 16px;
    padding-right: 8px;
    border-radius: 10px 0px 0px 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#keyboard-state {
    margin-right: 8px;
    padding-right: 16px;
    border-radius: 0px 10px 10px 0px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#custom-pacman {
    padding-left: 16px;
    padding-right: 8px;
    border-radius: 10px 0px 0px 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#custom-mail {
    margin-right: 8px;
    padding-right: 16px;
    border-radius: 0px 10px 10px 0px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#submap {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#clock {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px 0px 0px 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#custom-weather {
    padding-right: 16px;
    border-radius: 0px 10px 10px 0px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#pulseaudio {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#pulseaudio.muted {
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
    background: #383c4a;
}

#cpu {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#temperature {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#temperature.critical {
    background-color: #eb4d4b;
}

#backlight {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#battery {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
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
    background: #383c4a;
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
