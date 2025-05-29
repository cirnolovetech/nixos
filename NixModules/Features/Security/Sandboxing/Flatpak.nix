{ user, config, pkgs, ... }:

{
 services.flatpak.enable = true;
 users.users.${user} = {
  packages = with pkgs; [
   gnome-software
  ];
 };
}
