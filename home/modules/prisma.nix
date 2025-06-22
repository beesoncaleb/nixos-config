{
  config,
  pkgs,
  lib,
  ...
}: 
let
  prismaPath = pkgs.prisma-engines;
in {

  home = {
    packages = with pkgs; [ 
        prisma-engines
    ];

    # environment variables required for prisma to work
    sessionVariables = {
      PRISMA_QUERY_ENGINE_BINARY  = "${prismaPath}/bin/query-engine";
      PRISMA_SCHEMA_ENGINE_BINARY = "${prismaPath}/bin/schema-engine";
      PRISMA_QUERY_ENGINE_LIBRARY = "${prismaPath}/lib/libquery_engine.node";
      PRISMA_FMT_BINARY           = "${prismaPath}/lib/prisma-fmt";
    };
  };

}
