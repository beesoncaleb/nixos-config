{
  config,
  pkgs,
  ...
}: {

  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>Telescope live_grep<CR>";
	key = "<leader>fg";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
	key = "<leader>ff";
      }
    ];

    plugins = {
      telescope = {
        enable = true;
      };
    };
  };

}
