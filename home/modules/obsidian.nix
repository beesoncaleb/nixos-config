{
  config,
  pkgs,
  ...
}: {

  programs.obsidian = {
    enable = true;
    
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
