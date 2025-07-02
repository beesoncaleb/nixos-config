{ 
  config, 
  pkgs, 
  ... 
}: {

  imports = [
    ./waybar
    ./hyprland
    ./swww
    ../modules/hyprshot.nix
    ../modules/dunst.nix
  ];

  programs = {
    wofi.enable = true;
  };


}
