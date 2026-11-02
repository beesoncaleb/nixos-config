{
  config,
  pkgs,
  unstable-pkgs,
  ...
}: {

  programs.cursor = {
    enable = true;

    package = unstable-pkgs.code-cursor;
  };

}
