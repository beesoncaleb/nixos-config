{
  config,
  pkgs,
  ...
}: {

  config = {
    home.packages = with pkgs; [
      thokr
    ];

    # modify default word count to 45 instead 15 on typing tests
    custom.extraBashAliases = {
      thokr = "thokr -w 45";
    };
  };
}
