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
    cgd = "sudo nix-collect-garbage -d";

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
   userEmail = "cirnolovetech@protonmail.com";
 };

 home.packages = with pkgs; [
  cava cmatrix cbonsai asciiquarium-transparent
  ventoy-full eza bat file-roller
  binutils cpio libarchive gnutar
  bzip3 gzip lrzip lz4 lzip lzop
  p7zip dar tarlz unar lhasa unzip 
  gnome-disk-utility gparted
 ];

}
