{
  config,
  pkgs,
  username,
  ...
}: {

  users.users.${username}.extraGroups = [ "libvirtd" "kvm" ];

  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
    };
  };
  virtualisation.spiceUSBRedirection.enable = true;

}
