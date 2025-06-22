# My Nixos Config

This is my Nixos config, I use Hyprland with Kitty for my windowmanager and terminal emulator, with neovim for my code editor. If you have any cool suggestions for where to take my config feel free to email me at caleb.f.beeson@gmail.com.

For my general philosophy for Nix config I like to avoid adding abstractions for packages and programs that have a lot of configuration options. For example hyprland and waybar, I could configure those through home-manager but then I need to read through documenation and often source code to properly get it working, I would rather configure them like normal and simply tack them onto my configuration through home-manager.

## Current Issues
- Waybar is busted
- Neovim config has not been moved into nixos config


## Future Endeavours
- Create host for my desktop
- Create universal host that can run from usb flash drive
- Rice my shit
