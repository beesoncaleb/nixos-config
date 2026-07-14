{
  config,
  pkgs,
  ...
}: {

  home.packages = with pkgs; [
    grim
    slurp
    libnotify
    jq
  ];

  programs.hyprshot = {
    enable = true;
    saveLocation = "$HOME/screenshots";
  };
}
