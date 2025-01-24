{ config, pkgs, ... }:

{
  # Information
  home.username = "cirno";
  home.homeDirectory = "/home/cirno";

  # Version
  home.stateVersion = "24.05";

  # Packages
  home.packages = [
   pkgs.fastfetch
 ];

  programs.fastfetch = {
   enable = true;
   settings = {
    logo = {
     source = "nixos";
     padding = {
     top = 0;
     down = 0;
     left = 1;
     right = 2;
   };
 };
    display = {
     size = {
     binaryPrefix = "si";
 };
     separator = " : ";
  };
  modules = [
    {
      type = "custom";
      keyColor = "white";
      format = "┌─────────────── Cirno ───────────────┐";
    }
    {
      type = "custom";
      format = "";
    }
    {
      type = "os";
      key = "";
      format = "{2} {8}";
    }
    {
      type = "kernel";
      key = "";
    }
    {
      type = "packages";
      key = "󰏗";
      format = "{37} {38}";
    }
    {
      type = "cpu";
      key = "󰍛";
      format = "{1}";
    }
    {
      type = "gpu";
      key = "󰍛";
    }
    {
      type = "de";
      key = "";
    }
    {
      type = "display";
      key = "󰍹";
      format = "{1}x{2} with {3}Hz";
    }
    {
      type = "uptime";
      key = "󰥔";
      format = "{1} days {2} hours {3} minutes";
    }
    {
      type = "custom";
      format = "";
    }
    {
      type = "custom";
      keyColor = "white";
      format = "└─────────────────────────────────────┘";
    }
      "break"
   ];
  };
 };

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
