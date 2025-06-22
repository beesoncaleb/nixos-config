{
  config,
  pkgs,
  lib,
  ...
}: {

  home.file."~/.config/nvim".source = ./nvim;

}
