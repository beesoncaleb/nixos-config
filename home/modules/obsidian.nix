{
  config,
  pkgs,
  ...
}: {

  programs.obsidian = {
    enable = true;

    # Declare vault so that settings apply
    vaults.notes = {
      target = "drive/notes";
    };

    defaultSettings = {
        app = {
          vimMode = true;
        };
        
        appearance = {
          theme = "obsidian";
        };
      };
    };
}
