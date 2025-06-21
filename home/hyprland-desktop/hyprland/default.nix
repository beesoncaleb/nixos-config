{
  config,
  pkgs,
  lib,
  ...
}: {

home.packages = with pkgs; [
  playerctl
  brightnessctl
];

programs.kitty.enable = true;

# symlink hyprland config file to nixos config file location
home.file.".config/hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink ./hyprland.conf;

# ensure that hyprland is reloaded if the current config file is deleted for the symlink
home.activation.hyprReload = lib.hm.dag.entryAfter ["writeBoundary"] ''
  if command -v hyprctl >/dev/null; then
    hyprctl reload || true
  fi
'';

}
