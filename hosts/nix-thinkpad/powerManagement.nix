{
  config,
  pkgs,
  ...
}: {

  # enable powertop autotuning and system76 cpu scheduling
  powerManagement.powertop.enable = true;         
  services.system76-scheduler.settings.cfsProfiles.enable = true;

  # enable thermald for Intel CPU
  services.thermald.enable = true;

  # disable gnome power profile bullshit
  services.power-profiles-daemon.enable = false;  

  services.tlp = {
    enable = true;

    settings = {
      CPU_ENERGY_PERF_POLICY_ON_AC  = "balance_performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      START_CHARGE_THRESH_BAT0      = 75;
      STOP_CHARGE_THRESH_BAT0       = 80;
      PLATFORM_PROFILE_ON_AC        = "balanced";
      PLATFORM_PROFILE_ON_BAT       = "low-power";
    };
  };
}
