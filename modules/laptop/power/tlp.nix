{...}: {
  services = {
    tlp = {
      enable = false;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "ondemand"; #powersave

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance"; #balance-power
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance-performance"; #power

        PLATFORM_PROFILE_ON_AC = "performance"; #low-power
        PLATFORM_PROFILE_ON_BAT = "balanced"; #low-power

        USB_EXCLUDE_BTUSB = 1;

        RADEON_DPM_PERF_LEVEL_ON_AC = "high"; #auto
        RADEON_DPM_PERF_LEVEL_ON_BAT = "auto"; #low

        DISK_IOSCHED = ["none"];

        # Battery charge thresholds for office usage
        #START_CHARGE_THRESH_BAT1 = 30;
        #STOP_CHARGE_THRESH_BAT1 = 80;

        # Battery charge thresholds for on-road usage
        START_CHARGE_THRESH_BAT1 = 85;
        STOP_CHARGE_THRESH_BAT1 = 90;
      };
    };
    power-profiles-daemon = {
      enable = false;
    };
  };
}
