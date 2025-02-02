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
    hms = "home-manager switch --flake ${flakeDir}";
    conf = "nvim ${flakeDir}/nixos/configuration.nix";
    pkgs = "nvim ${flakeDir}/nixos/packages.nix";

    ll = "ls -l";
    nv = "nvim";
    se = "sudoedit";
    ff = "fastfetch";
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
