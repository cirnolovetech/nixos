{ pkgs, ... }:

{
 home.packages = with pkgs; [
  bat
  eza
 ];

 programs.zsh = {
  enable = true;
  autosuggestion.enable = true;
  enableCompletion = true;
  syntaxHighlighting = {
   enable = true;
  };
  shellAliases = {
   cat = "${pkgs.bat}/bin/bat";
   c = "clear";
   f = "${pkgs.yazi}/bin/yazi";
   ".." = "cd ../";
   "...." = "cd ../../";
   "......" = "cd ../../../";
   rswitch = "sudo nixos-rebuild switch --flake /etc/nixos#default";
   rboot = "sudo nixos-rebuild boot --flake /etc/nixos#default";
   nixfiles = "cd ~/../../etc/nixos/";
   config = "cd ~/.config/";
   home = "cd";
   software = "cd ~/software/";
   switch = "git add . && sudo nixos-rebuild switch --flake /etc/nixos#default |& nom";
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
