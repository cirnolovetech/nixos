{ config, ... }: 

{

 nix.settings.auto-optimise-store = true;

 nixpkgs.config.allowUnfree = true;

}
