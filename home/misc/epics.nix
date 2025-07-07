{
  config,
  pkgs,
  ...
}: {

  imports = [
    ../modules/prisma.nix
  ];

  home.packages = with pkgs; [
    nodejs_24
    awscli2
  ];

}
