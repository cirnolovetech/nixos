{
 description = "Cirno magic flake";

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
 };

 outputs = {self, nixpkgs, home-manager, ...} @ inputs: 
 let
    system = "x86_64-linux";
    homeStateVersion = "24.11";
    user = "cirno";
 in
 {
  nixosConfigurations.default = nixpkgs.lib.nixosSystem {
   specialArgs = {inherit inputs;};
   modules = [
    ./configuration.nix
   ];
  };

  homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
   pkgs = nixpkgs.legacyPackages.${system};
   extraSpecialArgs = {inherit inputs homeStateVersion user;};

   modules = [
    ./home-manager/home.nix
   ];
  };
 };
}
