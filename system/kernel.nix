{
  pkgs,
  modulesPath,
  stateVersion,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  boot = {
    kernel.sysctl = {
      "net.core.netdev_max_backlog" = "16384";
      "net.core.somaxconn" = "8192";
      "net.ipv4.tcp_fastopen" = "3";
      "net.ipv4.tcp_max_syn_backlog" = "8192";
      "net.ipv4.tcp_keepalive_time" = "60";
      "net.ipv4.tcp_keepalive_intvl" = "10";
      "net.ipv4.tcp_keepalive_probes" = "6";
      "net.ipv4.tcp_mtu_probing" = "1";
      "net.core.default_qdisc" = "cake";
      "net.ipv4.tcp_congestion_control" = "bbrv2";
    };
    kernelParams = [
      "quiet"
      "loglevel=3"
      "nowatchdog"
    ];
    kernelPackages = pkgs.linuxPackages_zen;
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };
  system = { inherit stateVersion; };
}
