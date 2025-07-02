{
  config,
  pkgs,
  lib,
  ...
}: 
let
  defaultBashAliases = {
      vi      = "nvim .";
      dr      = "tree -L";
      dra     = "tree -La";
      la      = "ls -la";
      rebuild = "sudo nixos-rebuild switch --flake ~/.nixos#nix-thinkpad";
      listgen = "nixos-rebuild list-generations";
  };
in {

  options.custom.extraBashAliases = lib.mkOption {
    type = lib.types.attrs;
    default = {};
    description = "Additional Bash aliases";
  };

  config.programs.bash = {
    enable = true;

    shellAliases = (defaultBashAliases // config.custom.extraBashAliases);

    # fix to source environment variables in ~/.profile
    initExtra = ''
      [ -f ~/.profile ] && source ~/.profile
      mkdir -p $HOME/screenshots
    '';
  };
}
