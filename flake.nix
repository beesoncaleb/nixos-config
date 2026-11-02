{
  description = "My system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; #unstable input for packages where LTS lags behind

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, agenix, ... }@inputs:
  {
    nixosConfigurations = {

      nix-thinkpad = let
        username = "beeso";
        nixvim = inputs.nixvim.homeModules.nixvim;
        system = "x86_64-linux";
        
        # Instantiate the unstable packages for the system
        unstable-pkgs = import inputs.nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      in nixpkgs.lib.nixosSystem {
        inherit system;
        
        specialArgs = {
          inherit username inputs unstable-pkgs;
        };

        modules = [
          ./hosts/nix-thinkpad
          home-manager.nixosModules.home-manager
          {
            nixpkgs.config.allowUnfree = true;

            home-manager = {
              extraSpecialArgs = { 
                inherit username inputs nixvim agenix unstable-pkgs; 
                host="nix-thinkpad"; 
              };
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [ agenix.homeManagerModules.default ];
              backupFileExtension = "backup";

              users.${username} = import ./users/${username}/home.nix;
            };
          }
        ];
      };
    };
  };
}
