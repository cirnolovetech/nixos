{
 description = "Flake";

 inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  home-manager = {
   url = "github:nix-community/home-manager";
   inputs.nixpkgs.follows = "nixpkgs";
  };
 };

 outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
   pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
   {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
     specialArgs = {inherit inputs;};
     modules = [ ./configuration.nix ];
    };

    homeConfigurations.cirno = home-manager.lib.homeManagerConfiguration {
     pkgs = nixpkgs.legacyPackages.${system};
     modules = [ ./home-manager/home.nix ];
    };
   };
}
