{
  config,
  pkgs,
  lib,
  ...
}: 
let
  prismaPath = pkgs.prisma-engines;
in {

  config = {
    home.packages = with pkgs; [
      prisma-engines
    ];

    # environment variables required for prisma to work
    customBashEnvVariables = [
      "export PRISMA_QUERY_ENGINE_BINARY=${prismaPath}/bin/query-engine"
      "export PRISMA_SCHEMA_ENGINE_BINARY=${prismaPath}/bin/schema-engine"
      "export PRISMA_QUERY_ENGINE_LIBRARY=${prismaPath}/lib/libquery_engine.node"
      "export PRISMA_FMT_BINARY=${prismaPath}/lib/prisma-fmt"
    ];
  };
}
