{ config, pkgs, username, ... }:

let
  mountPoint = "${config.home.homeDirectory}/utd";
in
{

  imports = [
    ../../home/core
    ../../home/hyprland-desktop
    ../../home/misc/onedrive-service.nix

    # Temporary Configuration
    ../../home/misc/epics.nix   #for epics related packages and config, better to make this into a development environment when I can

    # Alias to bash script for checking if new deadlines for ai class
    ../../home/misc/ai-deadline.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
  };

  programs.git = {
    enable = true;
    userName = "beesoncaleb";
    userEmail = "caleb.f.beeson@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      url."git@github.com:".insteadOf = "https://github.com/";
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
