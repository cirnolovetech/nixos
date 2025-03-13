{ config, pkgs, ... }:

{

 programs.zsh = {
  enable = true;
  autosuggestion.enable = true;
  enableCompletion = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
   c = "clear";
   f = "yazi"
   sf = "sudo yazi";
   rswitch = "sudo nixos-rebuild switch --flake /etc/nixos#default";
   rboot = "sudo nixos-rebuild boot --flake /etc/nixos#default";
   conf = "cd /etc/nixos/";
   config = "cd ~/.config/";
   switch = "sudo git add . && sudo nixos-rebuild switch --flake /etc/nixos#default";
   ".." = "cd ../";
   "...." = "cd ../../";
   "......" = "cd ../../../";
  };

  oh-my-zsh = {
   enable = true;
   plugins = [
    "git"
    "direnv"
   ];
   theme = "kafeitu";
  };
 };

}
