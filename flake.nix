{
 description = "Cirno Flake";

 inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  
  home-manager = {
   url = "github:nix-community/home-manager";
   inputs.nixpkgs.follows = "nixpkgs";
  };

  stylix = {
   url = "github:danth/stylix/release-24.11";
   inputs.nixpkgs.follows = "nixpkgs";
  };

  hyprland.url = "github:hyprwm/Hyprland";
 };

 outputs = { self, nixpkgs, home-manager, ... } @ inputs: 
 let
  system = "x86_64-linux";
  homeStateVersion = "25.05";
  user = "cirno";
  hosts = [
   { hostname = "amd-laptop"; stateVersion = "25.05"; }
  ];

  makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
   system = system;
   specialArgs = {
    inherit inputs stateVersion hostname user;
   };
   modules = [
    ./Hosts/${hostname}/Config.nix
   ];
  };
 in

 {
  nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
   configs // {
    "${host.hostname}" = makeSystem {
     inherit (host) hostname stateVersion;
    };
   }) {} hosts;

  homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
   pkgs = nixpkgs.legacyPackages.${system};
   extraSpecialArgs = {
    inherit inputs homeStateVersion user;
   };
   modules = [
    ./HomeModules
   ];
  };
 };
}
