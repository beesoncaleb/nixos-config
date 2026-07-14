{ 
  lib, 
  ... 
}: let 
  combineSets = import ../lib/combineSets.nix { inherit lib; };   # Helper function that combines all config sets in the config list

  # Config Modules
  keybinds = import ./keybinds.nix { inherit lib; };
  animations = import ./animations.nix;
  input = import ./input.nix;
  layout = import ./layout.nix;

  # Startup Apps
  startup = import ./startup.nix { inherit lib; };

  # Devices
  logitechMouse = import ./devices/logitech-mx-master-3s.nix;
  
  # Combined list of separate configuration modules
  configModules = [

    keybinds
    animations
    input
    layout

    startup

    logitechMouse

  ];

in lib.recursiveUpdate {

  # Helpful rule so that apps can't maximize on their own :) (Thanks Vaxry)
  window_rule = {
    name = "suppress-maximize-events";
    match = { class = ".*"; };
    supress_event = "maximize";
  };

  # TODO: Make hyprland config more plug and play
  monitor = {
    output   = "";
    mode     = "preferred";
    position = "auto";
    scale    = "auto";
  };

} (combineSets configModules)
