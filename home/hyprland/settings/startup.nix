{ lib, ... }: let 
  cmds = [ 
    "waybar"
    "hyprpaper"
  ];

  luaCmds = builtins.concatStringsSep "\n" (builtins.map (cmd: ''hl.exec_cmd("${cmd}")'') cmds);
in {

  on = {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline
        ''
        function () 
          ${luaCmds}
        end
        ''
      )
    ];
  };

}
