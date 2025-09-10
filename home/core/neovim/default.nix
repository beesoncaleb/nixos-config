{
  config,
  pkgs,
  nixvim,
  ...
}: {

  imports = [
    nixvim
    ./globalOpts.nix
    ./ftplugin.nix

    # plugins
    ./plugins/telescope.nix
    ./plugins/toggleterm.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    keymaps = [
      # Netrw bind
      {
        action = "<cmd>Ex<CR>";
        key = "<leader>dr";
      }
    ];
    
    colorschemes.onedark = {
      enable = true;
    };

    plugins = {
      treesitter = {
        enable = true;
      };

      web-devicons = {
        enable = true;
      };
    };
  };

}
