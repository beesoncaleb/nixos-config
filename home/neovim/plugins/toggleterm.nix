{
  config,
  pkgs,
  lib,
  ...
}: {

  programs.nixvim = {

    # Map a toggle for 10 terminal workspaces
    keymaps = 
      lib.genList
        (term: {
          mode = "n";
          key = "<leader>t${toString term}";
          action = "<cmd>${toString term}ToggleTerm direction=float name=Term${toString term}<CR>";
        }) 
        10
    # other keymaps
    ++ [
      # Keeps entering normal mode consistent in terminal mode
      {
        mode = "t";
        key = "<Esc>";
        action = ''<C-\><C-n>'';    # use multiline so that '\' isn't interpolated
      }

      # Base toggle term utility for exiting terminals
      {
        mode = "n";
        key = "<leader>tt";
        action = "<cmd>ToggleTerm<CR>";
      }
    ];


    plugins.toggleterm = {
      enable = true;
    };

  };

}
