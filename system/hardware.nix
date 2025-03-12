{
  lib,
  config,
  pkgs,
  ...
}:
{
  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
    graphics.extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
    ];
  };
  services.blueman.enable = true;
}
