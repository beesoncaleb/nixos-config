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
    ./plugins/oil.nix
    ./plugins/treesitter.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    
    colorschemes.onedark = {
      enable = true;
    };

    # Simple Plugins with no config
    plugins = {
      web-devicons.enable = true;
    };

  };

}
