{ pkgs, ... }:

{
 
 imports = [
  ./neovim.nix
  ./zsh.nix
 ];

 programs.kitty = {
  enable = true;
  settings = { 
   confirm_os_window_close = 0;
   enable_audio_bell = false;
  };
 };

}
