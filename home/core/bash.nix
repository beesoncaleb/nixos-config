{
  config,
  pkgs,
  lib,
  ...
}: 
let
  defaultEnvVar = [
      "export vi='nvim .'"
      "export dr='tree -L'"
      "export dra='tree -La'"
      "export la='ls -la'"
      "export rebuild='sudo nixos-rebuild switch --flake ~/.nixos#nix-thinkpad'"
      "export listgen='nixos-rebuild list-generations'"
  ];
in {

  options.customBashEnvVariables = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [];
    description = "additional Bash environment variables aside from the defaults";
  };

  config.programs.bash = {
    enable = true;

    shellInit = lib.concatStringsSep "\n" (defaultEnvVar ++ config.customBashEnvVariables);
  };
}
