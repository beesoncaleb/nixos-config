{
  config,
  pkgs,
  ...
}: {

  programs.gradle = {
    enable = true;
  };

  programs.java = {
    enable = true;
  };

}
