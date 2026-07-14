{
  config,
  pkgs,
  lib,
  ...
}: {

  programs.nixvim = {
    keymaps = [
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
