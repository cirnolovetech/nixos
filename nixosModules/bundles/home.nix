{ inputs, ... }: 

{

  imports = [ inputs.home-manager.nixosModules.default ];

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.cirno = {
      imports = [
        ./../../homeModules
      ];
    };
  };


}
