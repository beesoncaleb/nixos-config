{
  config,
  pkgs,
  ...
}: {

  imports = [
    ../modules/prisma.nix
  ];

  config = {
    home.packages = with pkgs; [
      nodejs_24
      awscli2
    ];
    
    custom.extraBashAliases = {
      rrup = "cd ${config.home.homeDirectory}/work/Rainbow-Roundup-Calendar-Event-App";
    };
  };
}
