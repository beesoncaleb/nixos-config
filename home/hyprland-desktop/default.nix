{ 
  config, 
  pkgs, 
  ... 
}: {

  services = {

    # TAG - Configure notification daemon later when ricing
    dunst = {
      enable = true;
    };

    swww.enable = true;
  };

  programs = {
    wofi.enable = true;
  };

  imports = [
    ./waybar
    ./hyprland
  ];

}
