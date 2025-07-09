{
  config,
  pkgs,
  ...
}: {

  config.custom.extraBashAliases = {
    aicheck = "~/school/ai/deadline-check/check-deadline.sh";
  };

  config.home.packages = with pkgs; [
    pup
  ];
}
