{ config, pkgs, ... }:

{
 programs.firejail = {
  enable = true;
  wrappedBinaries = {
   brave = {
    executable = "${pkgs.brave}/bin/brave";
    profile = "${pkgs.firejail}/etc/firejail/brave.profile";
    extraArgs = [
     "--ignore=private-dev"
     "--env=GTK_THEME=Adwaita:dark"
     "--dbus-user.talk=org.freedesktop.Notifications"
    ];
   };
   signal-desktop = {
    executable = "${pkgs.signal-desktop}/bin/signal-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland";
    profile = "${pkgs.firejail}/etc/firejail/signal-desktop.profile";
    extraArgs = [
     "--env=GTK_THEME=Adwaita:dark"
    ];
   };
  };
 };
}
