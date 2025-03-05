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
    kernelParams = [
      "quiet"
      "loglevel=3"
      "nowatchdog"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
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
