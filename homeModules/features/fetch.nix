{ pkgs, ... }:

{

 programs.fastfetch = {
  enable = true;
  settings = {
   logo = {
    source = ./images/NixOwO.png;
    type = "kitty";
    height = 10;
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
    "break"
   ];
  }; 
 };

}
