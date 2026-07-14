{
  config,
  pkgs,
  lib,
  ...
}: let
  hyprlandConfig = import ./settings { inherit lib; };
in {

  imports = [
    ../modules/waybar
    ../modules/hyprpaper.nix
    ../modules/hyprshot.nix
    ../modules/dunst.nix
  ];

  home.packages = with pkgs; [
    playerctl
    brightnessctl
  ];

  programs.kitty.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    settings = hyprlandConfig;
  };

  programs = {
    wofi.enable = true;
  };
}
