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

      ovmf = {
        enable = true;
        packages = [ pkgs.OVMFFull.fd ];
      };

      swtpm.enable = true;
    };
  };

  virtualisation.spiceUSBRedirection.enable = true;

}
