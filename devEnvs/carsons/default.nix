{ pkgs, prisma-pkgs, ... }: pkgs.mkShell {
  
  
  packages = [
    pkgs.pnpm
    pkgs.nodejs_24
    prisma-pkgs.prisma-engines
  ];

  shellHook = ''

    export PRISMA_QUERY_ENGINE_BINARY="${prisma-pkgs.prisma-engines}/bin/query-engine";
    export PRISMA_MIGRATION_ENGINE_BINARY="${prisma-pkgs.prisma-engines}/bin/migration-engine";
    export PRISMA_QUERY_ENGINE_LIBRARY="${prisma-pkgs.prisma-engines}/lib/libquery_engine.node";

    echo 'Entered UTD Procurement dev shell'
    echo "Packages:"
    echo "  pnpm:   `pnpm --version`"
    echo "  node:   `node --version`"

    # Modify prompt to give visual indicator of shell
    export PS1="\n\[\e[32m\][Carson's Village]\[\e[0m\] $PS1"
  '';
}
