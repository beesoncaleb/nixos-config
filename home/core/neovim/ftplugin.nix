{
  config,
  pkgs,
  ...
}: {

  programs.nixvim = {
    files = {
      "after/ftplugin/markdown.lua" = {
        opts = {
          wrap = true;
          linebreak = true;
        };
        keymaps = [
          {
            action = "gj";
            key = "j";
          }
          {
            action = "gk";
            key = "k";
          }
        ];
      };
    };
  };

}
