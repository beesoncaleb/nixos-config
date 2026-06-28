{
  config,
  pkgs,
  lib,
  ...
}: 
let
  hyprlandConfig = import ./hyprland.nix;
in {

  home.packages = with pkgs; [
    playerctl
    brightnessctl
  ];

  programs.kitty.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    extraConfig = hyprlandConfig;

    # TODO: Migrate hyprland config to Lua or switch to Niri, use Hyprland legacy config for now
    configType = "hyprlang";
  };

}
