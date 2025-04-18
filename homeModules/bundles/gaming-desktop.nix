{ pkgs, ... }:

{

 programs.mangohud = {
  enable = true;
  settings = {
   control = "mangohud";
   legacy_layout = 0;
   horizontal = true;
   battery = true;
   gpu_stats = true;
   cpu_stats =true;
   cpu_power = true;
   gpu_power = true;
   ram = true;
   fps = true;
   frametime = 0;
   no_small_font = true;
   hud_no_margin = true;
   table_columns = 14;
   frame_timing = 1;
  };
 };

 home.packages = with pkgs; [
  steamtinkerlaunch
  protonup-ng
  xclicker
  prismlauncher
  luanti
 ];

} 
  
