{ config, pkgs, ... }:

{

 programs.zsh = {
  enable = true;
  autosuggestion.enable = true;
  enableCompletion = true;
  syntaxHighlighting.enable = true;
  shellAliases = 
   let
    flakeDir = "/etc/nixos";
   in {
    conf = "cd /etc/nixos/";
    config = "cd ~/.config/";

    rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
    upd = "nix flake update ${flakeDir}";
    upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
   
   ".." = "cd ../";
   "...." = "cd ../../";
   "......" = "cd ../../../";

   gs = "git status";
   ga = "git add";
   gc = "git commit";
   gp = "git push";
   sgs = "git status";
   sga = "sudo git add";
   sgc = "sudo git commit";
   sgp = "sudo git push";
   
   c = "clear";
   f = "yazi";
   sf = "sudo yazi";
   ll = "ls -l";
   nv = "nvim";
   v = "nvim";
   ff = "fastfetch";
  };  
   
  history.size = 100;

  oh-my-zsh = {
   enable = true;
   plugins = [
    "git"
    "sudo"
   ];
   theme = "agnoster";
  };
 };

 programs.git = {
  enable = true;
   userName = "cirnolovetech";
   userEmail = "chillinwithmao@gmail.com";
 };

}
