{ 
  config,
  ... 
}: let
  mountdir = "/home/beeso/drive";
  client_id = "1025117883006-fn5pormfjehpoa71sh8udrfsqfcbcv0a.apps.googleusercontent.com";
in {
  # Agenix secrets
  age.secrets."rclone-client-secret".file = ../../secrets/rclone-client-secret.age;
  age.secrets."rclone-token".file = ../../secrets/rclone-token.age;

  programs.rclone = {
    enable = true;

    remotes.gdrive = {
      config = {
        type = "drive";
        scope = "drive";
        client_id = client_id;
        config_is_local = true; 
        disable_http2 = true;
      };

      secrets = {
        client_secret = config.age.secrets."rclone-client-secret".path;
        token = config.age.secrets."rclone-token".path;
      };

      mounts.drive = {
        enable = true;
        mountPoint = mountdir;
        options = {
          allow-non-empty = true;
          allow-other = true;
          buffer-size = "256M";
          cache-dir = "/home/beeso/.cache/rclone";
          vfs-cache-mode = "full";
          vfs-read-chunk-size = "128M";
          vfs-read-chunk-size-limit = "1G";
          dir-cache-time = "5000h";
          poll-interval = "15s";
          vfs-cache-max-age = "1h";
          vfs-cache-max-size = "1G";
        };
      };
    };
  };

  # Ensure the mount directory exists
  systemd.user = {
    startServices = "sd-switch";
    tmpfiles.rules = [
      "d ${mountdir} 0755 beeso users -"
    ];
  };
}
