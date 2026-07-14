{ lib, ... }: {
  bind = let
    modKey = "ALT_R";
    terminal = "kitty";
    browser = "firefox";
    menu = "wofi --show drun -G";
  in lib.flatten [

    ##############################
    ###       Main Binds       ###
    ##############################

    # Open Terminal
    {
      _args = [
        "${modKey} + Q"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("${terminal}")'')
      ];
    }

    # Open Browser
    {
      _args = [
        "${modKey} + W"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("${browser}")'')
      ];
    }

    # Open App Menu
    {
      _args = [
        "${modKey} + R"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("${menu}")'')
      ];
    }

    # Shutdown
    {
      _args = [
        "${modKey} + Z"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("shutdown now")'')
      ];
    }

    ##############################
    ###    Screenshot Binds    ###
    ##############################

    # Screenshot Active Window
    {
      _args = [
        "${modKey} + PRINT"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("hyprshot -m window -m active")'')
      ];
    }

    # Screenshot Monitor with Active Window
    {
      _args = [
        "PRINT"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("hyprshot -m output --output $(hyprctl activewindow -j | jq -r '.monitor')")'')
      ];
    }

    # Screenshot Selected Section
    {
      _args = [
        "SHIFT + PRINT"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("hyprshot -m region")'')
      ];
    }

    ##############################
    ###      Window Binds      ###
    ##############################

    # Window Focus Movement Binds
    (map (dir:
      {
        _args = [
          "${modKey} + ${dir.key}"
          (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "${dir.move}" })'')
        ];
      }
    ) [
      { key = "H"; move = "left"; }
      { key = "L"; move = "right"; }
      { key = "K"; move = "up"; }
      { key = "J"; move = "down"; }
    ])

    # Window Workspace Focus Binds
    (builtins.genList (key:
      {
        _args =  let
          workspace = builtins.toString (key + 1);
          num = builtins.toString (lib.mod (key + 1) 10);
        in [
          "${modKey} + ${num}"
          (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = ${workspace} })")
        ];
      }
    ) 10)

    # Move Window to Workspace Binds
    (builtins.genList (key:
      {
        _args =  let
          workspace = builtins.toString (key + 1);
          num = builtins.toString (lib.mod (key+1) 10);
        in [
          "SHIFT + ${modKey} + ${num}"
          (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = ${workspace} })")
        ];
      }
    ) 10)

    # Move Window within Workspace Binds
    (map (dir:
      {
        _args = [
          "SHIFT + ${modKey} + ${dir.key}"
          (lib.generators.mkLuaInline ''hl.dsp.window.move({ direction = "${dir.move}" })'')
        ];
      }
    ) [
      { key = "H"; move = "left"; }
      { key = "L"; move = "right"; }
      { key = "K"; move = "up"; }
      { key = "J"; move = "down"; }
    ])

    # Kill Active Window
    {
      _args = [
        "${modKey} + C"
        (lib.generators.mkLuaInline "hl.dsp.window.close()")
      ];
    }

    # Fullscreen Active Window
    {
      _args = [
        "${modKey} + F"
        (lib.generators.mkLuaInline "hl.dsp.window.fullscreen()")
      ];
    }

    ##############################
    ###      Media Binds       ###
    ##############################

    # Volume Up
    {
      _args = [
        "XF86AudioRaiseVolume"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")'')
        { locked = true; repeating = true; }
      ];
    }

    # Volume Down
    {
      _args = [
        "XF86AudioLowerVolume"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'')
        { locked = true; repeating = true; }
      ];
    }

    # Mute Audio
    {
      _args = [
        "XF86AudioMute"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'')
        { locked = true; repeating = true; }
      ];
    }

    # Mute Mic
    {
      _args = [
        "XF86AudioMicMute"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")'')
        { locked = true; repeating = true; }
      ];
    }

    # Play Next
    {
      _args = [
        "XF86AudioNext"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl next")'')
        { locked = true; }
      ];
    }

    # Play Previous
    {
      _args = [
        "XF86AudioPrev"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl previous")'')
        { locked = true; }
      ];
    }

    # Play
    {
      _args = [
        "XF86AudioPlay"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl play")'')
        { locked = true; }
      ];
    }

    # Pause
    {
      _args = [
        "XF86AudioPause"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl pause")'')
        { locked = true; }
      ];
    }

    ##############################
    ###      Screen Binds      ###
    ##############################

    # Brightness Up
    {
      _args = [
        "XF86MonBrightnessUp"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+")'')
        { locked = true; repeating = true; }
      ];
    }

    # Brightness Down
    {
      _args = [
        "XF86MonBrightnessDown"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-")'')
        { locked = true; repeating = true; }
      ];
    }

  ];
}
