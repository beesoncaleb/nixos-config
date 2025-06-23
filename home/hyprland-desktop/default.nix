{ 
  config, 
  pkgs, 
  ... 
}: {

  imports = [
    ./waybar
    ./hyprland
    ./dunst.nix
    ./swww
  ];

  programs = {
    wofi.enable = true;
  };


}
