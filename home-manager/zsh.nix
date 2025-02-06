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
    rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
    upd = "nix flake update ${flakeDir}";
    upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
    hmg = "home-manager generations";
    hmr = "home-manager remove-generations";
    hms = "home-manager switch";
    conf = "sudo nvim /etc/nixos/configuration.nix";

    ll = "ls -l";
    nv = "nvim";
    se = "sudoedit";
    mf = "microfetch";
   };

  # History
  history.size = 10000;
  history.path = "${config.xdg.dataHome}/zsh/history";

  # Oh My Zsh
  oh-my-zsh = {
   enable = true;
   plugins = [ "git" "sudo" ];
   theme = "agnoster";
  };
 };
}
