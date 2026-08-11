{
  config,
  pkgs,
  ...
}: {
  # Delta Pager for Git Diff viewing
  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      dark = true;
      side-by-side = true;
      hyperlinks = true;
      navigate = true;
    };
  };
}
