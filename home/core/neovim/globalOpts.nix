{
  config,
  pkgs,
  ...
}: {

  programs.nixvim = {
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

      scrolloff = 5;
    };
  };

}
