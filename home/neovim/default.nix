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
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    
    colorschemes.onedark = {
      enable = true;
    };

    # Simple Plugins with no config
    plugins = {
      treesitter.enable = true;
      web-devicons.enable = true;
    };

  };

}
