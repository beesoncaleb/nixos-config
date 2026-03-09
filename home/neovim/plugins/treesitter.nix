{
  config,
  pkgs,
  lib,
  ...
}: {

  programs.nixvim = {
    keymaps = [
      # Keeps entering normal mode consistent in terminal mode
      #{
      #  mode = "t";
      #  key = "<Esc>";
      #  action = ''<C-\><C-n>'';    # use multiline so that '\' isn't interpolated
      #}

      # Toggle folds at cursor
      {
        mode = "n";
        key = "<leader>uf";
        action = "za";
      }

      # Open all folds
      {
        mode = "n";
        key = "<leader>ur";
        action = "zR";
      }
    ];

    plugins.treesitter = {
      enable = true;
      folding.enable = true;
      indent.enable = true;
      highlight.enable = true;
    };
  };

}
