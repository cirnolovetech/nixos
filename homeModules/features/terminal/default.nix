{ config, pkgs, ... }:

{

 imports = [
  ./kitty.nix
  ./monitor.nix
  ./neovim.nix
  ./packages.nix
 ];

 programs.zsh = {
  enable = true;
  autosuggestion.enable = true;
  enableCompletion = true;
  syntaxHighlighting.enable = true;
  shellAliases = {
   c = "clear";
   f = "yazi";
   sf = "sudo yazi";
   conf = "cd /etc/nixos/";
   config = "cd ~/.config/";
   switchamdlaptop = "sudo git add . && sudo nixos-rebuild switch --flake /etc/nixos#amd-laptop";
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

 programs.git = {
  enable = true;
   userName = "cirnolovetech";
   userEmail = "chillinwithmao@gmail.com";
 };

}
