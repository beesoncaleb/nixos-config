{
  config,
  pkgs,
  ...
}: {

  imports = [
    ./bash.nix
    ./office-suite
    ./neovim
    ../modules/obsidian.nix
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
    python313
    python313Packages.pip
    file
    feh
    dbeaver-bin
    xournalpp
    keymapp
  ];

}
