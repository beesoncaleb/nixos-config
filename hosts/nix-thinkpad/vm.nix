{
  config,
  pkgs,
  username,
  ...
}: {

  users.users.${username}.extraGroups = [ "input" "kvm" ];

  environment.systemPackages = with pkgs; [
    quickemu
    swtpm
    qemu_kvm
    virt-viewer
    spice-gtk
    OVMF
  ];
}
