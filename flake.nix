{

  description = "My system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

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

  outputs = { self, nixpkgs, home-manager, agenix, ... }@inputs:
  {
    nixosConfigurations = {

      nix-thinkpad = let
        username = "beeso";
        nixvim = inputs.nixvim.homeModules.nixvim;
      in nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit username;
          inherit inputs;
        };

        system = "x86_64-linux";

        modules = [
          ./hosts/nix-thinkpad
          home-manager.nixosModules.home-manager
          {
            nixpkgs.config.allowUnfree = true;

            home-manager = {

              extraSpecialArgs = { inherit username; inherit inputs; inherit nixvim; inherit agenix; host="nix-thinkpad"; };
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [ agenix.homeManagerModules.default ];

              users.${username} = import ./users/${username}/home.nix;
            };
          }
        ];
      };
    };
  };
}
