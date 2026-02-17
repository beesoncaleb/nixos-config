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

      proc    = "cd ~/work/UTDesign-Procurement";
      cars    = "cd ~/work/Carson-s-Village";
      pwm     = "cd ~/work/Center-for-Children-and-Families-Attendance-Tracker";
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

      # Function for initiating basic development environments
      ndev() {
        local DEV_PATH="$HOME/.nixos/devEnvs/"
        
        # If no argument is provided, list available environments
        if [ -z "$1" ]; then
          echo "Usage: ndev <environment>"
          echo "Available environments:"
          ls -d1 "''${DEV_PATH}"*/ 2>/dev/null | sed "s|^''${DEV_PATH}|    |" | sed "s|/$||"
          return 1
        fi

        # Enter the specific development shell and use profile if it exists
        local PROFILE="''${DEV_PATH}''${1}/profile" 

        if [[ -L "$PROFILE" && -e "$PROFILE" ]]; then
          echo "Using cached environment"
          nix develop "$PROFILE"
        else
          echo "No cached environment, installing dependencies"
          nix develop --profile "$PROFILE" "''${DEV_PATH}''${1}"
        fi
          
        return 1
      }
    '';
  };
}
