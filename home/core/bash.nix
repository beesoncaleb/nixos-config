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
    
      # fall2025 class aliases
      auto    = "cd ~/school/fall25/automata";
      net     = "cd ~/school/fall25/comp-networks";
      proj    = "cd ~/school/fall25/comp-proj";
      data    = "cd ~/school/fall25/databases";
      ml      = "cd ~/school/fall25/machine-learning";
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
