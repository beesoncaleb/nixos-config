{
  config,
  pkgs,
  ...
}: {

  programs.nixvim = {
    keymaps = [
      {
        action  = "<cmd>Oil<CR>";
        key     = "<leader>dr";
      }
    ];
    
    plugins.oil = {
      enable = true;
      settings = {

        use_default_keymaps = false;

        keymaps = {
          "<leader>h"   = "<cmd>Oil ~<CR>";
          "<CR>"        = "actions.select";
          "-"           = "actions.parent";
          "<leader>p"   = "actions.preview";
          "<leader>c"   = "actions.close";
          "<leader>l"   = "actions.refresh";
          "<leader>r"   = "actions.open_cwd";
          "<leader>w"   = "actions.cd";
          "<leader>tw"  = "actions.tcd";
          "<leader>s"   = "actions.change_sort";
          "<leader>."   = "actions.toggle_hidden";
        };

      };
    };
    
  };

}
