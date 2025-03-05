{ lib, config, ... }:
{
  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };
  services.blueman.enable = true;
}
