{ pkgs, ... }:

{

 programs.fastfetch = {
  enable = true;
  settings = 
   {
    logo = {
     source = ./Logo.png;
     type = "kitty";
     height = 14;
     padding = {
      top = 1;
     };
    }; 

    display = {
     separator = " ";
    };

    modules = [
     "break"
     "break"
     {
      type = "title";
      keyWidth = 10;
     }
     "break"
     {
      type = "os";
      key = " ";
      keyColor = "blue";
     }
     {
      type = "kernel";
      key = " ";
      keyColor = "blue";
     }
     {
      type = "packages";
      format = "{} (nixpkgs)";
      key = " ";
      keyColor = "blue";  
     }
     {
      type = "shell";
      key = " ";
      keyColor = "blue";
     }
     {
      type = "terminal";
      key = " ";
      keyColor = "blue"; 
     }
     {
      type = "wm";
      key = " ";
      keyColor = "blue";
     }
     {
      type = "uptime";
      key = "󰥔 ";
      keyColor = "blue"; 
     }
     "break"
     "colors"
     "break"
     "break"
    ];
   }; 
 };

}
