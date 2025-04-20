{ pkgs, ... }:

{

 imports = [
  ./stylix
  ./wayland
  ./chromium.nix
  ./fastfetch.nix
  ./kitty.nix
  ./neovim.nix
  ./xdg.nix
  ./zsh.nix
 ];

 home.packages = with pkgs; [
  cava cmatrix cbonsai
  ventoy-full file-roller
  p7zip unar unzip
 ];

}
