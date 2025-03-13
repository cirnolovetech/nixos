{ config, pkgs, ... }: 

{

 security.rtkit.enable = true;

 services = {
  playerctld.enable = true;
  pipewire = {
   enable = true;
   wireplumber.enable = true;
   alsa = {
    enable = true;
    support32Bit = true;
   };
   jack.enable = true;
   pulse.enable = true;
  };
 };

}
