let 
  beeso = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKpoOvHomUglVF+h6amNpjy8Tli8OjPz5kcTVKZDYerZ caleb.f.beeson@gmail.com";
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMeLex1vOXdKvn/doAVzNUHZM3WLDq54k32cqjsUt0Vp root@nix-thinkpad";
in {
  "rclone-client-secret.age".publicKeys = [ beeso system ]; 
  "rclone-token.age".publicKeys = [ beeso system ]; 
}
