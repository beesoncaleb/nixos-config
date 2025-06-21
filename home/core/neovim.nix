{
  config,
  pkgs,
  inputs,
  ...
}: {

  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  nixvim = {
    enable = true;
    defaultEditor = true;
  };

}
