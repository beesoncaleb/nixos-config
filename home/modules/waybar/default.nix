{
  config,
  pkgs,
  lib,
  ...
}: {

  # TODO: Fix this with proper configuration

  programs.waybar.enable = true;

  # symlink waybar config to config in nixos directory
  home.file.".config/waybar/config".source = ./config;
  home.file.".config/waybar/style.css".source = ./style.css;

}
