{ 
  config, 
  pkgs, 
  username, 
  ... 
}: {
  imports = [
        # Fix this later, you just moved the simple installation lines to files and it's dumb
        ../../home/hyprland-desktop
        ../../home/neovim

        ../../home/modules/bash.nix
        ../../home/modules/java.nix
        ../../home/modules/thokr.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
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
      opencode
    ];
  };

  programs = {
    firefox.enable = true;
    google-chrome.enable = true;

    git = {
      enable = true;

      settings = {
        user.name = "beesoncaleb";
        user.email = "caleb.f.beeson@gmail.com";
        init.defaultBranch = "main";
        url."git@github.com:".insteadOf = "https://github.com/";
      };
    };

  };

  # Little configuration for VM using libvirtd and virt-manager
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
