{ config, pkgs, ... }:

{
  # Information
  home.username = "cirno";
  home.homeDirectory = "/home/cirno";

  # Version
  home.stateVersion = "24.05";

  # Packages
  home.packages = [ ];

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status \n $username$hostname$directory";
      character = {
        success_symbol = "[](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "chillinwithmao";
    userEmail = "chillinwithmao@gmail.com";
  };

  # Managing Dotfiles
  home.file = {

  };

  # Environment Variables
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Home Manager
  programs.home-manager.enable = true;
}
