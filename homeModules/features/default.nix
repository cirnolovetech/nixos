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
  ventoy-full eza bat file-roller
  binutils cpio libarchive gnutar
  bzip3 gzip lrzip lz4 lzip lzop
  p7zip dar tarlz unar lhasa unzip
 ];

}
