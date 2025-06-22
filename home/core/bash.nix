{
  config,
  pkgs,
  lib,
  ...
}: 
let
  defaultEnvVar = {
      vi      = "nvim .";
      dr      = "tree -L";
      dra     = "tree -La";
      la      = "ls -la";
      rebuild = "sudo nixos-rebuild switch --flake ~/.nixos#nix-thinkpad";
      listgen = "nixos-rebuild list-generations";
  };
in {

  options.customBashEnvVariables = lib.mkOption {
    type = lib.types.attrs;
    default = {};
    description = "additional Bash environment variables aside from the defaults";
  };

  config.programs.bash = {
    enable = true;

    sessionVariables = (defaultEnvVar // config.customBashEnvVariables);

    # fix to source environment variables in ~/.profile
    initExtra = ''
      [[ -f ~/.profile ]] &&  source ~/.profile
    '';
  };
}
