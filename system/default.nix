{
  config,
  pkgs,
  username,
  inputs,
  ...
}: {

  # Define user
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # Remove password from sudo command
  security.sudo.wheelNeedsPassword = false;

  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip ];
    browsing = true;
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  # System level packages
  environment.systemPackages = with pkgs; [
    usbutils
    unzip
    wget
    vim
    tree
    wev
    openssl
    ripgrep
    git
    neofetch
    curl
    fuse
    zip
    pandoc
    texlive.combined.scheme-full
    dig
    qbittorrent
    vlc
    btop
    traceroute
  ];

  # Add this rule so that moonlander keyboard works fine
  hardware.keyboard.zsa.enable = true;

  # Download nerd fonts
  fonts = {
    packages = with pkgs; [
      nerd-fonts.symbols-only # symbols icon only
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
    ];
  };

  # Enable network manager
  networking.networkmanager.enable = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable Mullvad VPN
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  # Time zone settings
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Set GDM as display manager
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  # Configure keymap in X11, necessary for GDM (LOOK INTO DIFFERENT DISPLAY MANAGER LATER)
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # enable hyprland for home-manager
  programs.hyprland.enable = true;

  # default gui file manager
  programs.thunar.enable = true;

  # xdg portals for hyprland support
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  hardware.graphics.enable = true;

  # enable nix-ld to avoid future issues with npm
  programs.nix-ld.enable = true;

  # enable sound wth pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
}
