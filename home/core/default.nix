{
  config,
  pkgs,
  ...
}: {

  imports = [
    ./bash.nix
    #./neovim.nix
  ];

  programs = {
    firefox.enable = true;
    google-chrome.enable = true;
  };

  home.packages = with pkgs; [
    discord
    neofetch
    gh
    gcc
  ];

}
