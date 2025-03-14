{ pkgs, ... }:

{

 home.packages = with pkgs; [
  # Minecraft
  prismlauncher
  ferium

  # Extras
  minetest

  # Tools
  xclicker
 ];

} 
  
