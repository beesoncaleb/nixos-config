{
  description = "General purpose Node dev shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }: let 

    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

  in {
    devShells."${system}".default = pkgs.mkShell {
      
      packages = [
        pkgs.pnpm
        pkgs.nodejs_24
      ];

      shellHook = ''
        # Modify prompt to give visual indicator of shell
        export PS1="\n\[\e[32m\][Node]\[\e[0m\] $PS1"
      '';
    };
  };
}
