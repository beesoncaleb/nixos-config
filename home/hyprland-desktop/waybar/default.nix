{
  config,
  pkgs,
  lib,
  ...
}: {

  programs.waybar.enable = true;
  
  # symlink waybar config to config in nixos directory
  home.file.".config/waybar/config".source = config.lib.file.mkOutOfStoreSymlink ./config;
  home.file.".config/waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink ./style.css;

  # ensure clean restart of waybar if original config is deleted for symlink
  home.activation.waybarRestart = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if pgrep -x waybar >/dev/null; then
      echo "Restarting Waybar..."
      pkill -x waybar
      setsid waybar >/dev/null 2>&1 &
    fi
  '';

}
