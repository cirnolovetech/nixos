{ pkgs, ... }:

{
 home.packages = with pkgs; [
  prismlauncher
  xclicker
 ];

 programs.mangohud = {
  enable = true;
 };
}
