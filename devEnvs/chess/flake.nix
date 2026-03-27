{
  description = "Development shell for my chess web app";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

  outputs = { self, nixpkgs, ... }: let 

    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

  in {
    devShells."${system}".default = pkgs.mkShell {
      
      packages = [
        pkgs.pnpm
        pkgs.nodejs_24
        pkgs.prisma-engines_7
      ];

      shellHook = ''
        # Modify prompt to give visual indicator of shell
        export PS1="\n\[\e[32m\][Chess Webapp]\[\e[0m\] $PS1"
      '';
    };
  };
}
