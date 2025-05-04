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
   in

    {
     rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
     upd = "nix flake update ${flakeDir}";
     upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
     cgd = "sudo nix-collect-garbage -d";
     gs = "git status";
     ga = "git add";
     gc = "git commit";
     gp = "git push";
     sgs = "git status";
     sga = "sudo git add";
     sgc = "sudo git commit";
     sgp = "sudo git push";
    };

  history.size = 100;
  oh-my-zsh = {
   enable = true;
   plugins = [ "git" "sudo" ];
   theme = "agnoster";
  };
 };
}
