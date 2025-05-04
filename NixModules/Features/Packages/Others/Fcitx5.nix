{ pkgs, ... }:

{
 i18n.inputMethod = {
  type = "fcitx5";
  enable = true;
  fcitx5 = {
   waylandFrontend = true;
   addons = with pkgs; [
    fcitx5-gtk
    fcitx5-bamboo
    fcitx5-unikey
   ];
  };
 };
}
