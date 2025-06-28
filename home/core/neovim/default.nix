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
    
    colorschemes.catppuccin = {
      enable = true;
      settings.flavor = "mocha";
    };

    plugins = {

      treesitter = {
        enable = true;
      };

      #nvim-ufo = {
      #  enable = true;
      #};
    };
  };

}
