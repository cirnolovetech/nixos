{ lib, pkgs, ... }:

 let
  defaultApps = {
   browser = ["brave-browser.desktop"];
   text = ["neovim.desktop"];
   image = ["imv.desktop"];
   audio = ["mpv.desktop"];
   video = ["mpv.desktop"];
   directory = ["thunar.desktop"];
   office = ["libreoffice.desktop"];
   pdf = ["org.pwmt.zathura.desktop"];
   terminal = ["kitty.desktop"];
   discord = ["vesktop.desktop"];
  };

  mimeMap = {
   text = ["text/plain"];
   image = [
    "image/bmp"
    "image/gif"
    "image/jpeg"
    "image/jpg"
    "image/png"
    "image/svg+xml"
    "image/tiff"
    "image/vnd.microsoft.icon"
    "image/webp"
   ];
   audio = [
    "audio/aac"
    "audio/mpeg"
    "audio/ogg"
    "audio/opus"
    "audio/wav"
    "audio/flac"
    "audio/webm"
    "audio/x-matroska"
   ];
   video = [
    "video/mp2t"
    "video/mp4"
    "video/mpeg"
    "video/ogg"
    "video/webm"
    "video/x-flv"
    "video/x-matroska"
    "video/x-msvideo"
   ];
   directory = ["inode/directory"];
   browser = [
    "application/xhtml+xml"
    "text/html"
    "text/htmlh"
    "x-scheme-handler/about"
    "x-scheme-handler/http"
    "x-scheme-handler/https"
    "x-scheme-handler/unknown"
   ];
   office = [
    "application/vnd.oasis.opendocument.text"
    "application/vnd.oasis.opendocument.spreadsheet"
    "application/vnd.oasis.opendocument.presentation"
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    "application/msword"
    "application/vnd.ms-excel"
    "application/vnd.ms-powerpoint"
    "application/rtf"
   ];
   pdf = ["application/pdf"];
   terminal = ["terminal"];
   discord = ["x-scheme-handler/discord"];
  };

  associations = with lib;
    listToAttrs (flatten (mapAttrsToList (key: map (type: attrsets.nameValuePair type defaultApps."${key}")) mimeMap));
 in

{
 services.cliphist.enable = true;

 programs = {
  btop.enable = true;
  imv.enable = true;
  mpv.enable = true;
  zathura = {
   enable = true;
   extraConfig = 
    ''
     set selection-clipboard clipboard
    '';
  };
 };

 home.packages = with pkgs; [ 
  libreoffice font-manager
  tor-browser signal-desktop
  xclip wl-clipboard 
  hyprshot hyprpicker
  nwg-displays pwvucontrol
  libnotify brightnessctl
 ];

 xdg = {
  configFile."mimeapps.list".force = true;
  mimeApps = {
   enable = true;
   associations.added = associations;
   defaultApplications = associations;
  };
  desktopEntries = {
   btop = {
    name = "btop++";
    noDisplay = true;
   };
   kitty = {
    name = "kitty";
    noDisplay = true;
   };
  }; 
 };
}
 

