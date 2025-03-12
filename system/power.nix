{
  services.irqbalance.enable = true;
  services.upower.enable = true; # hyprpanel requires upower
  programs.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "performance";
        turbo = "always";
        energy_performance_preference = "balance_performance";
      };
      battery = {
        governor = "powersave";
        turbo = "never";
        energy_performance_preference = "balance_power";
        scaling_max_freq = 1000000;
        enable_thresholds = true;
        start_threshold = 20;
        stop_threshold = 80;
      };
    };
  };
  powerManagement.enable = true;
}
