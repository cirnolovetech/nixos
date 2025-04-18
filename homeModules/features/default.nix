{ pkgs, ... }:

{

 imports = [
  ./stylix
  ./wayland
  ./brave.nix
  ./fastfetch.nix
  ./neovim.nix
  ./librewolf.nix
  ./xdg.nix
  ./zsh.nix
 ];

 home.packages = with pkgs; [
  cava cmatrix cbonsai asciiquarium
  ventoy-full eza bat file-roller
  binutils cpio libarchive gnutar
  bzip3 gzip lrzip lz4 lzip lzop
  p7zip dar tarlz unar lhasa unzip 
  gnome-disk-utility gparted
 ];

}
