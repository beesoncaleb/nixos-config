{
  config,
  pkgs,
  ...
}: {

  imports = [
    ./bash.nix
    ./office-suite
    ./neovim
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
    gnumake
    gdb
    wl-clipboard
    upower
    file
    feh
    dbeaver-bin
    xournalpp
    keymapp
  ];

}
