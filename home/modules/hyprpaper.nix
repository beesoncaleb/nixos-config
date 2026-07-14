{
  config,
  pkgs,
  ...
}: {

  services.hyprpaper = {
    enable = true;

    settings = {

      splash = false;

      wallpaper = [
        {
          # TODO: This is shit
          path = "~/.nixos/home/wallpapers/cyberpunk_citysky.png";
          fit_mode = "fill";
        }
      ];
    };
  };

}
