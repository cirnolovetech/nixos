{ config, pkgs, ... }:

{
imports = [
 ./zsh.nix
 ./modules/bundle.nix
];

home = {
 username = "cirno";
 homeDirectory = "/home/cirno";
 stateVersion = "24.11";
};
}
