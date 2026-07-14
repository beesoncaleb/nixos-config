{
  config = {

    general = {
      gaps_in          = 0;
      gaps_out         = 0;
      border_size      = 1;
      resize_on_border = false;
      allow_tearing    = false;
      layout           = "dwindle";
      dwindle.preserve_split = true;

      col = {
        active_border = { 
          colors = [
            "rgba(33ccffee)"
            "rgba(00ff99ee)"
          ]; 
          angle = 45;
        };

        inactive_border = "rgba(595959aa)";
      };

    };

    decoration = {

      rounding           = 5;
      rounding_power     = 2;
      active_opacity     = 1.0;
      inactive_opacity   = 1.0;
      animations.enabled = true;

      shadow = {
        enabled      = true;
        range        = 4;
        render_power = 3;
        color        = "rgb(1a1a1aee)";
      };

      blur = {
        enabled   = true;
        size      = 3;
        passes    = 1;
        vibrancy  = 0.1696;
      };

    };
  };
}
