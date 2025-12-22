{

  description = "My system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dev-shells.url = "path:./devEnvs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
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

              extraSpecialArgs = { inherit username; inherit nixvim; };
              useGlobalPkgs = true;
              useUserPackages = true;

              users.${username} = import ./users/${username}/home.nix;
            };
          }
        ];
      };
    };
  };
}
