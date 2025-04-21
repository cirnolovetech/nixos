{ pkgs, ... }:

{

 imports = [
  ./wayland
  ./fetch.nix
  ./kitty.nix
  ./mime.nix
  ./neovim.nix
  ./search.nix
  ./shell.nix
  ./stylix.nix
 ];

 home.packages = with pkgs; [
  cava cmatrix cbonsai
  p7zip unar unzip
 ];

}
