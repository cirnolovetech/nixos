{ config, pkgs, ... }:

{

 programs.neovim = {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
 };

 home.packages = with pkgs; [
  (lib.hiPrio (
    pkgs.runCommand "nvim.desktop" { } ''
      mkdir -p $out/share/applications
      cp ${config.programs.neovim.package}/share/applications/nvim.desktop $out/share/applications/nvim.desktop
    ''
  ))
 ];

}



