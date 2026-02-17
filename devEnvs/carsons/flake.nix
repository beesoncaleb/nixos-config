{
  description = "Development shell for Carson's Village EPICS project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    prismaPkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs, prismaPkgs, ... }: let 

    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    prisma-pkgs = import prismaPkgs { inherit system; };

  in {
    devShells."${system}".default = pkgs.mkShell {
      
      packages = [
        pkgs.pnpm
        pkgs.nodejs_24
        pkgs.auth0-cli
        prisma-pkgs.prisma-engines
      ];

      shellHook = ''
        export PRISMA_QUERY_ENGINE_BINARY="${prisma-pkgs.prisma-engines}/bin/query-engine";
        export PRISMA_MIGRATION_ENGINE_BINARY="${prisma-pkgs.prisma-engines}/bin/migration-engine";
        export PRISMA_QUERY_ENGINE_LIBRARY="${prisma-pkgs.prisma-engines}/lib/libquery_engine.node";

        # Modify prompt to give visual indicator of shell
        export PS1="\n\[\e[32m\][Carson's Village]\[\e[0m\] $PS1"
      '';
    };
  };
}
