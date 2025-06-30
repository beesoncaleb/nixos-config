{
  config,
  pkgs,
  nixvim,
  ...
}: {

  imports = [
    nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals.mapleader = " ";
    globalOpts = {
      number = true;
      relativenumber = true;
      ls = 2;

      wrap = false;
      autoindent = true;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      
      hlsearch = true;
    };

    keymaps = [
      # Telescope binds
      {
        action = "<cmd>Telescope live_grep<CR>";
	key = "<leader>fg";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
	key = "<leader>ff";
      }
    ];
    
    colorschemes.onedark = {
      enable = true;
    };

    plugins = {

      treesitter = {
        enable = true;
      };

      telescope = {
        enable = true;
      };

      #nvim-ufo = {
      #  enable = true;
      #};
    };
  };

}
