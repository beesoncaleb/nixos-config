{
  config,
  pkgs,
  ...
}: 
let
  mountPoint = "${config.home.homeDirectory}/utd";
in {

  home.packages = with pkgs; [
    rclone
  ];

  # Systemd user service to mount OneDrive
  systemd.user.services.rclone-onedrive = {
    Unit = {
      Description = "Mount OneDrive using rclone";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };

    Service = {
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${mountPoint}";
      ExecStart = ''
      ${pkgs.rclone}/bin/rclone mount utd: ${mountPoint} \
        --vfs-cache-mode full \
        --dir-cache-time 72h \
        --poll-interval 15s \
	--allow-other \
        --timeout 1m \
        --umask 002 \
        --rc \
        --rc-addr=localhost:5572 \
        --rc-no-auth \
        --log-level INFO
      '';
      ExecStop = "${pkgs.fuse}/bin/fusermount -u ${mountPoint}";
      Restart = "on-failure";
      Type = "notify";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
