{
  config,
  pkgs,
  nixvim,
  inputs,
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
    # Do this to ensure that nixvim follows nixpkgs and suppresses warnings
    nixpkgs.source = inputs.nixpkgs;

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
