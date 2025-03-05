{ host, lib, ... }:
{
  networking = {
    hostName = host;
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  };
}
