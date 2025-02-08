{ config, ... }:

{
 programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;

  shellAliases =
   let
    flakeDir = "~/nixos";
   in {
    rb = "sudo nixos-rebuild switch";
    upg = "sudo nixos-rebuild switch --upgrade";
    hmg = "home-manager generations";
    hmr = "home-manager remove generations";
    hme = "home-manager expire-generations";
    hms = "home-manager switch";
    conf = "sudo nvim /etc/nixos/configuration.nix";

    ll = "ls -l";
    nv = "nvim";
    mf = "microfetch";
   };

  history.size = 10000;
  history.path = "${config.xdg.dataHome}/zsh/history";

  oh-my-zsh = {
   enable = true;
   plugins = [ "git" "sudo" ];
   theme = "agnoster";
  };
 };
}
