{ pkgs, ... }: 

{

 imports = [
  ./home.nix
  ./user.nix
 ];

 boot.loader = {
  efi.canTouchEfiVariables = true;
  timeout = 3;
  systemd-boot = {
   enable = true;
   configurationLimit = 20;
   editor = false;
  };
 };

 i18n.defaultLocale = "en_US.UTF-8"; 
 i18n.extraLocaleSettings = {
   LC_ADDRESS = "vi_VN";
   LC_IDENTIFICATION = "vi_VN";
   LC_MEASUREMENT = "vi_VN";
   LC_MONETARY = "vi_VN";
   LC_NAME = "vi_VN";
   LC_NUMERIC = "vi_VN";
   LC_PAPER = "vi_VN";
   LC_TELEPHONE = "vi_VN";
   LC_TIME = "vi_VN";
  };

 time.timeZone = "Asia/Ho_Chi_Minh";
 time.hardwareClockInLocalTime = true;

 security.rtkit.enable = true;
 services = {
  pipewire = {
   enable = true;
   wireplumber.enable = true;
   alsa.enable = true;
   alsa.support32Bit = true;
   jack.enable = true;
   pulse.enable = true;
  };
  playerctld.enable = true;
 };

 fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
  nerd-fonts.fira-code
  nerd-fonts.droid-sans-mono
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-emoji
  noto-fonts-color-emoji
  dejavu_fonts	
  jetbrains-mono
  font-awesome
  powerline-fonts
  powerline-symbols
 ];

}

